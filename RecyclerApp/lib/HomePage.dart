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
  void getData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
    setState(() {
      name = (vari.data()as dynamic)['username'];
    });
  }

  AuthController authController = AuthController();

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
  void initState() {
    getData();
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
            height: 80,
            decoration: BoxDecoration(
                    color: Colors.brown
                  ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20,10,0,0),
                  child: Text('Selamat Datang, ${name}!',style: TextStyle(fontSize: 22),)),
                
              ],
            ),
          ),
          Row(
            children: [
              // Container(
              //     padding: EdgeInsets.fromLTRB(20, 0, 0, 50),
              //     child: Text(
              //       'Dana kamu: ',
              //     ))
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
// _fetch() async {
//   final firebaseUser = await FirebaseAuth.instance.currentUser();
//   if(firebaseUser != null) await FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).get().then((ds){
//     myUsername=ds.data['username'];
//     print(myUsername);
//   }).catchError((e){
//     print(e);
//   })
// }
