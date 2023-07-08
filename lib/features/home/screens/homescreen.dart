import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:snapsearch/constants/colors.dart';
import 'package:snapsearch/features/home/screens/albumscreen.dart';
import 'package:snapsearch/features/home/screens/displayimages.dart';
import 'package:snapsearch/features/home/screens/uploadimagestocloud.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex = 0;
 
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
    final screens = [
    const DisplayImages(),
    const UploadImagesToCloud(),
    const AlbumScreen(),
    ];
     
  @override
  
  Widget build(BuildContext context) {
     final items = <Widget>[
      Icon(Icons.add,
          color:
              (currentindex == 0) ? Colors.white : const Color(0xffC4C4C4)),
      Icon(Icons.list,
          color:
              (currentindex == 1) ? Colors.white : const Color(0xffC4C4C4)),
      Icon(
        Icons.compare_arrows,
        color: (currentindex == 2) ? Colors.white : const Color(0xffC4C4C4),
      ),
  
    ];
    return  Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: currentindex,
        height: 60.0,
        items: items,
        color: Colors.white, //navbar color
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: primaryColor,

        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            currentindex = index;
           
          });
        },
        letIndexChange: (index) => true,
      ),
      body: screens[currentindex],
    
    );
  }
}