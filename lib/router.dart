

import 'package:flutter/material.dart';
import 'package:snapsearch/features/auth/screens/authscreen.dart';
import 'package:snapsearch/features/home/screens/homescreen.dart';


Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthScreen.routename:
    return MaterialPageRoute(builder: (_)=> const AuthScreen());
    case HomeScreen.routename:
    return MaterialPageRoute(builder: (_)=> const HomeScreen());
    default: 
    return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text("Screen doesn't exist"),),));
  }
}