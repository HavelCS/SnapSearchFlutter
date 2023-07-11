// ignore_for_file: use_key_in_widget_constructors

import 'package:cross_file_image/cross_file_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:snapsearch/cloud_storage/cloud_storage.dart';
import 'package:snapsearch/constants/colors.dart';
import 'package:snapsearch/features/auth/services/auth_services.dart';
import 'package:snapsearch/provider/user_provider.dart';

class UploadImage extends StatefulWidget {
  
  const UploadImage(
      {super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  final AuthService authService = AuthService();
  bool isLoading = false;
  XFile? _image;

  selectImage() async {
    var im = await ImagePicker().pickImage(source: ImageSource.gallery);
    // Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }
  
  Future<void> uploadProilePicture(String id) async {
    String res = await CloudStorage().uploadImage(_image!, 'users', true, id);

  }

  @override
  Widget build(BuildContext context) {
     final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300.h,
            width: 414.w,
            decoration: BoxDecoration(
                color: const Color(0xffE5E8EC),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r))),
            child: Padding(
              padding: EdgeInsets.only(top: 150.h, left: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Please upload your\nprofile photo",
                    style: TextStyle(
                        height: 1.7.h,
                        color: const Color(0xff0d0d0d),
                        fontSize: 20.sp,
                        letterSpacing: 0.8,
                        fontFamily: 'CirkaBold',
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "To get the best result upload photo with\ndimensions 1080 x 1080",
                    style: TextStyle(
                        height: 1.6.h,
                        color: const Color(0xff121212),
                        fontSize: 13.sp,
                        letterSpacing: 0.5,
                        fontFamily: 'PoppinsRegular',
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          _image == null
              ? DottedBorder(
                  borderType: BorderType.Circle,
                  radius: const Radius.circular(20),
                  dashPattern: const [15, 10],
                  color: Colors.grey,
                  strokeWidth: 1,
                  child: Container(
                      height: 124.h,
                      width: 124.w,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: InkWell(
                        onTap: () {
                          selectImage();
                        },
                        child: const Icon(
                          Icons.add,
                          size: 50,
                          color: Color(0xff424242),
                        ),
                      )))
              : Container(),
          _image != null
              ? CircleAvatar(
                  radius: 55,
                  backgroundImage: XFileImage(_image!),
                  // backgroundColor: Colors.red,
                )
              : Container(),
          SizedBox(
            height: 270.h,
          ),
          Padding(
            padding:  EdgeInsets.only(left: 20.w, right: 20.w),
            child: InkWell(
              onTap: (){
                uploadProilePicture(user.id);
              },
              child: Container(
                        alignment: Alignment.center,
                        height: 58.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(7.r),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Set Profile Picture",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                    fontFamily: 'PoppinsRegular'),
                              ),
                      ),
            ),
          ),

        ],
      ),
    );
  }
}
