import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  final user = FirebaseAuth.instance.currentUser;

  Future getSampah() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.reference);
            }));
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
      body: Center(child: Image.asset('assets/images/notfound.png')),
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

   // child: SingleChildScrollView(
          //   child: Padding(
          //     padding: const EdgeInsets.all(20),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         StreamBuilder<QuerySnapshot>(
          //           stream: FirebaseFirestore.instance
          //               .collection("pesanan")
          //               .snapshots(),
          //           builder: (context, AsyncSnapshot snapshot) {
          //             if (snapshot.connectionState == ConnectionState.waiting) {
          //               return Center(
          //                 child: CircularProgressIndicator(),
          //               );
          //             }
          //             if (snapshot.hasData) {
          //               return GridView(
          //                   gridDelegate:
          //                       SliverGridDelegateWithFixedCrossAxisCount(
          //                           crossAxisCount: 2));
          //             }
          //             return Image.asset('assets/images/notfound.png');
          //           },
          //         )
          //       ],
          //     ),
          //   ),
          // ),
