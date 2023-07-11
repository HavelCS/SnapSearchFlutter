// ignore_for_file: prefer_const_constructors, unused_field, prefer_const_literals_to_create_immutables, unused_local_variable

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:snapsearch/cloud_storage/cloud_storage.dart';
import 'package:snapsearch/constants/colors.dart';
import 'package:snapsearch/constants/utils.dart';
import 'package:snapsearch/provider/user_provider.dart';
import 'package:tflite/tflite.dart';
import 'package:http/http.dart' as http;

class UploadImagesToCloud extends StatefulWidget {
  const UploadImagesToCloud({super.key});

  @override
  State<UploadImagesToCloud> createState() => _UploadImagesToCloudState();
}

class _UploadImagesToCloudState extends State<UploadImagesToCloud> {
  String? getImagePath;
  XFile? _image;
  Uint8List? bytes;

  Future<void> initTensorFlow() async {
    String? res = await Tflite.loadModel(
        model: "assets/ssd_mobilenet.tflite",
        labels: "assets/labels.txt",
        numThreads: 1, // defaults to 1
        isAsset:
            true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );
  }

  Future<void> selectImageFromgallery() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    String imagePath = "";
    setState(() async {
      if (image != null) {
        getImagePath = image.path;
        _image = image;
        File imageFile = File(_image!.path);
        Uint8List uint8List = await imageFile.readAsBytes();
        bytes = uint8List;
        getObjects();
      }
    });
  }

  Future<void> selectImageFromcamera() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    String imagePath = "";
    setState(() {
      if (image != null) {
        getImagePath = image.path;
        _image = image;
        getObjects();
      }
    });
  }

  Future<void> uploadImage(String id) async {
    if (_image != null) {
      String url = await CloudStorage().uploadImage(_image!, "users", true, id);
      print("uploaded");
      await http.post(Uri.parse("http://localhost:3000/upload"), body: {'url': url});
    } else {
      showSnackBar(context, "Select an image");
    }
  }

  Future<String>getObjects() async {
    var recognitions = await Tflite.detectObjectOnImage(
        path: getImagePath!, // required
        model: "SSDMobileNet",
        imageMean: 127.5,
        imageStd: 127.5,
        threshold: 0.4, // defaults to 0.1
        numResultsPerClass: 2, // defaults to 5
        asynch: true // defaults to true
        );
        return recognitions?[0]['label'];
  }

  @override
  void initState() {
    initTensorFlow();
    super.initState();
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 88.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Upload a photo",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'RobotoBold',
                    fontSize: 32,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(""),
              SizedBox(
                height: 32.h,
              ),
              _image != null
                  ? Container(
                      height: 350.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: MemoryImage(bytes!))),
                    )
                  : InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        onTap: () {
                                          selectImageFromgallery();
                                          Navigator.of(context).pop();
                                        },
                                        title:
                                            Text('Choose a Photo from Gallery'),
                                      ),
                                      ListTile(
                                        onTap: () {
                                          selectImageFromcamera();
                                          Navigator.of(context).pop();
                                        },
                                        title:
                                            Text('Choose a Photo from Camera'),
                                      ),
                                      ListTile(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        title: Text('Cancel'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Container(
                        height: 200.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(width: 3.w, color: primaryColor),
                            borderRadius: BorderRadius.circular(32.r)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.photo_camera_back,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              height: 16.sp,
                            ),
                            Text(
                              "Select File",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'PoppinsMedium',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
              SizedBox(
                height: _image != null ? 30.h : 350.h,
              ),
              InkWell(
                onTap: () {
                  uploadImage(user.id);
                },
                child: Container(
                    width: 382.w,
                    height: 58.h,
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
                    decoration: ShapeDecoration(
                      color: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      "Upload",
                      style: TextStyle(
                          fontFamily: 'PoppinsMedium',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )),
              )
            ],
          ),
        ));
  }
}
