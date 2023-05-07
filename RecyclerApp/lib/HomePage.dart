import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/auth.dart';
import 'package:mini_project/content.dart';
import 'package:mini_project/logout.dart';
import 'package:mini_project/profile.dart';
import 'package:mini_project/splash.dart';
import 'main.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "";
  void getDataName() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
    setState(() {
      name = (vari.data()as dynamic)['username'];
    });
  }

  AuthController authController = AuthController();

  // Future getSampah() async {
  //   await FirebaseFirestore.instance
  //   .collection('users')
  //   .get()
  //   .then((QuerySnapshot querySnapshot) {
  //       querySnapshot.docs.forEach((doc) {
  //           FirebaseFirestore.instance
  //              .doc(doc.id)
  //              .collection("jobPost")
  //              .get()
  //       });
  //   });
  // }

  @override
  void initState() {
    getDataName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/recycler.jpg',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('Re-Cycler'))
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 70,
            decoration: BoxDecoration(
                    color: Colors.grey
                  ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20,10,0,0),
                  child: Text('Hai, ${name}!',style: TextStyle(fontSize: 18),)),
                
              ],
            ),
          ),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 50),
                  child: Text(
                    'Dana',
                  )),
                  
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Center(child: Image.asset('assets/images/notfound.png')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => contentPage()));
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.brown,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => profilePage()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => logoutScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
