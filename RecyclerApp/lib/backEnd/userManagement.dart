import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mini_project/HomePage.dart';

class UserManagement{
  Widget handleAuth (){
    return new StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext (context, snapshot) {
        if(snapshot.hasData){
          return HomePage();
        }
      }),
      );

  }
}