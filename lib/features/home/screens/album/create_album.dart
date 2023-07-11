import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snapsearch/constants/colors.dart';
import 'package:snapsearch/features/auth/widgets/textfield.dart';


class CreateAlbum extends StatefulWidget {
  const CreateAlbum({super.key});

  @override
  State<CreateAlbum> createState() => _CreateAlbumState();
}

class _CreateAlbumState extends State<CreateAlbum> {
   List<String> images = [];
  TextEditingController controller = TextEditingController();
 
  @override
  
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding:  EdgeInsets.only(top: 150.h, left: 16.w, right: 15.w),
        child: Column(
          
          children: [
          TextFieldContainer(hinttext: 'Enter Album name', controller: controller, textInputType: TextInputType.text),
          SizedBox(height: 32.h,),
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
                  padding: EdgeInsets.zero,
                 itemCount: 12,
                 physics: AlwaysScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            // if(images.contains()){
                            //   images.remove();
                            // }else{
                            //   images.add();
                            // }
                          });
                        },
                        child: Container(
                          height: 112.h,
                          width: 112.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1465195079111-667efe5ba139?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"), fit: BoxFit.cover)
                          ),
                          // child: images.contains(value) ? Icon(Icons.check, color: primaryColor,) : null
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