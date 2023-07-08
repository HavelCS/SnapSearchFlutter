

import 'package:flutter/material.dart';

String uri = 'http://192.168.29.36:3000';



void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
