// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snapsearch/constants/colors.dart';
import 'package:snapsearch/features/home/screens/album/add_photo_to_album.dart';
import 'package:snapsearch/features/home/screens/album/create_album.dart';
import 'package:snapsearch/features/home/screens/album/viewgallary.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Column(
              children: [
                SizedBox(
                  height: 53.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 178.w),
                      child: Text(
                        "Album",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'NunitoMedium',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 240.h,
                                decoration: const BoxDecoration(
                                    color: Color(0xff1E2022),
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20))),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 30.h,
                                      left: 25.w,
                                      right: 25.w,
                                      bottom: 20.h),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context){
                                            return AddPhotoToAlbum();
                                          }));
                                        },
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          height: 44.h,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1.w,
                                                  color: const Color(0xff3C3D3F)),
                                              color: const Color(0xff2B2D2F),
                                              borderRadius:
                                                  BorderRadius.circular(6.r)),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 13.w),
                                            child: Text(
                                              'Add a picture to gallary',
                                              style: TextStyle(
                                                color: const Color(0x54ffffff),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'RobotoRegular',
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16.h,),
                                           InkWell(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                                return CreateAlbum();
                                              }));
                                            },
                                             child: Container(
                                                                                   alignment: Alignment.centerLeft,
                                                                                   height: 44.h,
                                                                                   width: double.infinity,
                                                                                   decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1.w,
                                                  color: const Color(0xff3C3D3F)),
                                              color: const Color(0xff2B2D2F),
                                              borderRadius:
                                                  BorderRadius.circular(6.r)),
                                                                                   child: Padding(
                                                                                     padding: EdgeInsets.only(left: 13.w),
                                                                                     child: Text(
                                              'Create a new gallary',
                                              style: TextStyle(
                                                color: const Color(0x54ffffff),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'RobotoRegular',
                                                fontSize: 14.sp,
                                              ),
                                                                                     ),
                                                                                   ),
                                                                                 ),
                                           ),
                                   SizedBox(height: 16.h,),
                                           Container(
                                        alignment: Alignment.centerLeft,
                                        height: 44.h,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1.w,
                                                color: const Color(0xff3C3D3F)),
                                            color: const Color(0xff2B2D2F),
                                            borderRadius:
                                                BorderRadius.circular(6.r)),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 13.w),
                                          child: Text(
                                            'Cancel',
                                            style: TextStyle(
                                              color: const Color(0x54ffffff),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'RobotoRegular',
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                
                                
                                
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: Container(
                          height: 32.h,
                          width: 32.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: primaryColor),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 60.h,
                ),
                //*List view of galleries
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: 2,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return InkWell(
                       onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ViewGallaryScreen();
                          }));
                        },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: Container(
                          height: 82.h,
                          width: 843,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1682685796852-aa311b46f50d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"),
                                  fit: BoxFit.fitWidth)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 15.h, left: 16.w, right: 16.w, bottom: 13.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dogs",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.sp,
                                          fontFamily: 'PoppinsSemiBold',
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      "Created by You",
                                      style: TextStyle(
                                          color: Color(0xffE0DDDC),
                                          fontFamily: 'RobotoRegular',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                Container(
                                  height: 40.h,
                                  width: 40.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Container(
                                      height: 38.h,
                                      width: 38.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                "https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg",
                                              ),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),





                SizedBox(
                  height: 16.h,
                ),
                Divider(
                  thickness: 2,
                  color: Color(0xfCACACA),
                ),
                SizedBox(
                  height: 32.h,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ViewGallaryScreen();
                          }));
                        },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: Container(
                          height: 82.h,
                          width: 843,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://cdn.britannica.com/94/125794-050-FB09B3F4/Hikers-Gore-Range-Mountains-Denver.jpg"),
                                  fit: BoxFit.fitWidth)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 15.h, left: 16.w, right: 16.w, bottom: 8.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hiking",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.sp,
                                          fontFamily: 'WrightRoman',
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      "Created by Jimmy",
                                      style: TextStyle(
                                          color: Color(0xffE0DDDC),
                                          fontFamily: 'WrightRomanRegular',
                                          fontSize: 14.sp,
                                          letterSpacing: 0.25,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                Container(
                                  height: 40.h,
                                  width: 40.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Container(
                                      height: 38.h,
                                      width: 38.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                "https://images.unsplash.com/photo-1466112928291-0903b80a9466?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
                                              ),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 100.h,
                )
              ],
            ),
          ),
        ));
  }
}
