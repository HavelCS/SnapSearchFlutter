import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snapsearch/constants/colors.dart';
import 'package:snapsearch/features/home/screens/album/giveaccess.dart';

class ViewGallaryScreen extends StatefulWidget {
  const ViewGallaryScreen({super.key});

  @override
  State<ViewGallaryScreen> createState() => _ViewGallaryScreenState();
}

class _ViewGallaryScreenState extends State<ViewGallaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text("Shared Album"),
        leading: const BackButton(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 16.h,
            ),
            Container(
              height: 123.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1430232324554-8f4aebd06683?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1632&q=80"),
                      fit: BoxFit.fitWidth)),
              child: Padding(
                padding: EdgeInsets.only(top: 56.h, left: 16.w, right: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Dogs",
                          style: TextStyle(
                              fontFamily: 'PoppinsSemiBold',
                              fontWeight: FontWeight.w700,
                              fontSize: 24.sp,
                              color: Colors.white),
                        ),
                        Text("Created by havel",
                            style: TextStyle(
                                fontFamily: 'PoppinsMedium',
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                color: Color(0xffd2d4d6)))
                      ],
                    ),
                    Text(
                      "102 Photos",
                      style: TextStyle(
                          color: Color(0xffEBEBEB),
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          fontFamily: 'PoppinsMedium'),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return GiveAccessScreen();
                }));
              },
              child: Container(
                height: 48.h,
                alignment: Alignment.center,
                width: double.infinity.w,
                decoration: BoxDecoration(
                    color: Color(0xff212426),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Invite People",
                        style: TextStyle(
                            color: Color(0xff948DFF),
                            fontFamily: 'PoppinsMedium',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "3 People",
                        style: TextStyle(color: Color(0xffC4C4C4)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Text(
              "Photos",
              style: TextStyle(
                  color: Color(0xffC4C4C4),
                  fontFamily: 'RobotoRegular',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
              child: GridView.builder(
                 itemCount: 12,
                 physics: AlwaysScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Scaffold(
                            body: Center(
                              child: Image.network("https://images.unsplash.com/photo-1465195079111-667efe5ba139?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"),
                            ),
                          );
                          }));
                        },
                        child: Container(
                          height: 112.h,
                          width: 112.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1465195079111-667efe5ba139?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"), fit: BoxFit.cover)
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          
          ],
        ),
      ),
    );
  }
}
