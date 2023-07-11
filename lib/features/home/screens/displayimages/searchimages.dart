// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:snapsearch/constants/colors.dart';


class SearchDisplayImages extends StatefulWidget {
  const SearchDisplayImages({super.key});

  @override
  State<SearchDisplayImages> createState() => _SearchDisplayImagesState();
}

class _SearchDisplayImagesState extends State<SearchDisplayImages> {
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
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: BackButton(),
      ),
    body:  Padding(
      padding: const EdgeInsets.only(top:15.0),
      child: MasonryGridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: images.length,
                gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,), itemBuilder: (context,index){
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
    )
          
          
    );
  }
}