// ignore_for_file: unused_local_variable


import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:snapsearch/cloud_storage/cloud_storage.dart';

import 'package:tflite/tflite.dart';

import '../../../provider/user_provider.dart';

class RecognizationScreen extends StatefulWidget {
  const RecognizationScreen({super.key});

  @override
  State<RecognizationScreen> createState() => _RecognizationScreenState();
}

class _RecognizationScreenState extends State<RecognizationScreen> {
 
  String? getImagePath;
  XFile? _image;


 

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



  Future<void> selectImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    String imagePath = "";
    setState(() {
      if (image != null) {
        getImagePath = image.path;
        _image = image;
        getObjects();
      }
    });
  }

  
  Future<void> uploadImage(String id) async{
    String url = await CloudStorage().uploadImage(_image!, "users", true, id);
    print("uploaded");
  }

  Future<void> getObjects() async {
    var recognitions = await Tflite.detectObjectOnImage(
        path: getImagePath!, // required
        model: "SSDMobileNet",
        imageMean: 127.5,
        imageStd: 127.5,
        threshold: 0.4, // defaults to 0.1
        numResultsPerClass: 2, // defaults to 5
        asynch: true // defaults to true
        );
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
      body: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: InkWell(
                onTap: () {
                  selectImage();
                },
                child: Container(
                  height: 40,
                  width: 80,
                  color: Colors.blue,
                  child: const Text(
                    "Pick Image",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () => {
                uploadImage("some kind of id")
              },
              child: Container(
                height: 40,
                width: 80,
                color: Colors.blue,
                child: const Text(
                  "Upload Image",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
