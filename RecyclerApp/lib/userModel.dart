import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? _email;
  String? _nomorHp;
  String? _password;
  String? _username;

  UserModel();

  UserModel.fromJson(Map<String, dynamic> json) {
    _email = json['email'];
    _nomorHp = json['nomorHp'];
    _password = json['password'];
    _username = json['username'];
  }
}
