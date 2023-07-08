
import 'package:flutter/material.dart';
import 'package:snapsearch/models/user_model.dart';

class UserProvider extends ChangeNotifier{
  UserModel _user = UserModel(
   
    email: '', id: '', name: '', password: '',  token: '');

  UserModel get user => _user;

  void setUser(String user) {
    _user = UserModel.fromJson(user);
    notifyListeners();
  }
}