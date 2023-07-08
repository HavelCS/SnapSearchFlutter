import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:snapsearch/constants/utils.dart';

void httpErrorhandler(
    {required VoidCallback onsuccess,
    required http.Response response,
    required BuildContext context}) {
  switch (response.statusCode) {
    case 200:
      onsuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['error']);
      break;
    default:
      showSnackBar(context, response.body);
  }
}
