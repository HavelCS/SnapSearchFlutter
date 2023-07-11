import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoosePhotos extends StatefulWidget {
  const ChoosePhotos({super.key});

  @override
  State<ChoosePhotos> createState() => _ChoosePhotosState();
}

class _ChoosePhotosState extends State<ChoosePhotos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Select Photos"),
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
    );
  }
}