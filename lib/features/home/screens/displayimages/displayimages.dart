// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:snapsearch/constants/colors.dart';
import 'package:snapsearch/features/home/screens/displayimages/searchimages.dart';

class DisplayImages extends StatefulWidget {
  const DisplayImages({super.key});

  @override
  State<DisplayImages> createState() => _DisplayImagesState();
}

class _DisplayImagesState extends State<DisplayImages> {
  TextEditingController controller = TextEditingController();
  final List<String> images = [
      
    'https://images.unsplash.com/photo-1688108957215-f315d62e61db?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY4ODg0MDAxNg&ixlib=rb-4.0.3&q=80&w=1080',
    'https://images.unsplash.com/photo-1685788769454-e6fe5f7b4d55?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY4ODg0MDAyOQ&ixlib=rb-4.0.3&q=80&w=1080',
     'https://images.unsplash.com/photo-1687368438644-3ba4c870a26c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY4ODg0MDEwMg&ixlib=rb-4.0.3&q=80&w=1080'
     'https://images.unsplash.com/photo-1687085932670-7cd128666507?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY4ODg0MDExMg&ixlib=rb-4.0.3&q=80&w=1080'
  'https://images.unsplash.com/photo-1685429558205-526520bf5b4e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY4ODg0MDEyNg&ixlib=rb-4.0.3&q=80&w=1080'
    'https://images.unsplash.com/photo-1688108957215-f315d62e61db?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY4ODg0MDAxNg&ixlib=rb-4.0.3&q=80&w=1080',
    'https://images.unsplash.com/photo-1685788769454-e6fe5f7b4d55?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY4ODg0MDAyOQ&ixlib=rb-4.0.3&q=80&w=1080',
     'https://images.unsplash.com/photo-1687368438644-3ba4c870a26c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY4ODg0MDEwMg&ixlib=rb-4.0.3&q=80&w=1080'
     'https://images.unsplash.com/photo-1687085932670-7cd128666507?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY4ODg0MDExMg&ixlib=rb-4.0.3&q=80&w=1080'
  'https://images.unsplash.com/photo-1685429558205-526520bf5b4e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY4ODg0MDEyNg&ixlib=rb-4.0.3&q=80&w=1080',
   'https://images.unsplash.com/photo-1685429558205-526520bf5b4e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY4ODg0MDEyNg&ixlib=rb-4.0.3&q=80&w=1080'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      actions: [
        Padding(
          padding:  EdgeInsets.only(right: 20.w),
          child: Container(
            height: 30.h,
            width: 30.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1685429558205-526520bf5b4e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY4ODg0MDEyNg&ixlib=rb-4.0.3&q=80&w=1080"))
            ),
          ),
        )
      ],
      title: Text("Snapsearch", style: TextStyle(color: Colors.white, fontSize: 16.sp, fontFamily: 'WrightRomanBold', letterSpacing: 1),),
    ),
    backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h), child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Best place to share", style: TextStyle(
                color: Colors.white,
                fontFamily: 'WrightRomanBold',
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                height: 1.5
              ),),
               Text("your photos", style: TextStyle(
                color: Colors.white,
                fontFamily: 'WrightRomanRegular',
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                height: 1.5
              ),),
              SizedBox(height: 40.h,),
             Row(
              children: [
                 Container(
                height: 50.h,
                width: 374.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.r)
                ),
                child: TextField(
                  controller: controller,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'WrightRomanRegular',
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      letterSpacing: 0.5
                    ),
                  decoration: InputDecoration(
                    prefixIcon: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return SearchDisplayImages();
                        }));
                      },
                      child: Icon(Icons.search, color: Colors.black, )),
                    contentPadding: EdgeInsets.only(left: 12.w,top: 13.h ),
                    border: InputBorder.none,
                    hintText: 'Search for photos',
                    hintStyle: TextStyle(
                      color: Color(0xffB9BDC3),
                      fontFamily: 'WrightRomanRegular',
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      letterSpacing: 0.5
                    )
                    
                  ),
                ),
              ),
            
             
              ],
             )
              

            ],
          ), ),
          SizedBox(height: 70.h,),
          Expanded(
            child: MasonryGridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: images.length,
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,), itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Scaffold(
                          body: Center(child: Image.network(images[index], fit: BoxFit.fill)),
                        );
                      }));
                    },
                    child: Container(child: Image.network(images[index]))))
              );
            }),
          
          
          ),
        ],
      )
    );
  }
}