// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:snapsearch/constants/colors.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
            backgroundColor: backgroundColor,
      body: Center(
        child: Text("Display Albums"),
      ),
    );
  }
}