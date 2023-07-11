import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snapsearch/features/home/screens/album/choose_photos.dart';
import 'package:snapsearch/features/home/screens/album/viewgallary.dart';


class AddPhotoToAlbum extends StatefulWidget {
  const AddPhotoToAlbum({super.key});

  @override
  State<AddPhotoToAlbum> createState() => _AddPhotoToAlbumState();
}

class _AddPhotoToAlbumState extends State<AddPhotoToAlbum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Select Album", style: TextStyle(
            color: Colors.white,
            fontFamily: 'WrightRomanBold',
            fontWeight: FontWeight.w500,
            fontSize: 18.sp
          ),),
          SizedBox(height: 20.h,),
          Text("Photos", style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'RobotoRegular'
          ),),
          SizedBox(height: 5.h,),
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
                            return ChoosePhotos();
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




        ],
      ),
    );
  }
}