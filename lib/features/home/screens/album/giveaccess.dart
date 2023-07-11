import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snapsearch/constants/colors.dart';

class GiveAccessScreen extends StatefulWidget {
  const GiveAccessScreen({super.key});

  @override
  State<GiveAccessScreen> createState() => _GiveAccessScreenState();
}

class _GiveAccessScreenState extends State<GiveAccessScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: backgroundColor,
        elevation: 2,
        title: Form(
          child: TextField(
            controller: searchController,
            style: const TextStyle(
                color: Colors.white, fontFamily: 'PoppinsRegular'),
            decoration: const InputDecoration(
                hintStyle: TextStyle(
                    color: Colors.white, fontFamily: 'PoppinsRegular'),
                hintText: 'Search for a user...',
                border: InputBorder.none),
            onChanged: (String value) {
              setState(() {});
            },
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),

             ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: [
                      Container(
                        height: 35.h,
                        width: 35.w,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",), fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        "Havel",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'PoppinsMedium',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.add,
                    color: Colors.grey,
                  ),
                );
              },
            ),
         
         


             
            //*show the name of those who are already given the access
         
           
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: [
                      Container(
                        height: 35.h,
                        width: 35.w,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",), fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        "Havel",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'PoppinsMedium',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.delete,
                    color: Colors.grey,
                  ),
                );
              },
            )
         
         
         
          ],
        ),
      ),
    );
  }
}
