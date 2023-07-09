import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snapsearch/constants/colors.dart';


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
        backgroundColor: Colors.transparent,
        title: const Text("Shared Album"),
        leading: const BackButton(color: Colors.white),
      ),
      body: Column(
        children: [
       SizedBox(height: 16.h,),
       Container(
        height: 123.h,
        width: 343,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          image: const DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1688808879312-50cf52c27f25?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=686&q=80"), fit: BoxFit.fitWidth)
        ),
       )
        ],
      ),
    );
  }
}