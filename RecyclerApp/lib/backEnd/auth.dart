import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mini_project/HomePage.dart';
import 'package:mini_project/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class AuthController extends GetxController {
  //signup
  final TextEditingController usernamebaruController = TextEditingController();
  final TextEditingController nomorHp = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  

  //login

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> createAccount() async {
    final user = await _auth.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    final firestore = FirebaseFirestore.instance;
    firestore.collection('users').doc(user.user!.uid).set({
      "username": usernamebaruController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "nomorHp": nomorHp.text,
      "alamat": alamatController.text
    });
    if (user != null) {
      Get.to(HomePage());
    } else {
      print('error');
    }
  }


  Future signIn() async {
    final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
      if (user != null) {
      Get.to(HomePage());
    } else {
      print('error');
    } 
  }

  Future<void> logoutUser() async {
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAll(loginRegister());
  }
}




