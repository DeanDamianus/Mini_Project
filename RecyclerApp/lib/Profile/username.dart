import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/Profile/profile.dart';
import 'package:mini_project/backEnd/auth.dart';

class usernameEdit extends StatefulWidget {
  const usernameEdit({super.key});

  @override
  State<usernameEdit> createState() => _usernameEditState();
}

class _usernameEditState extends State<usernameEdit> {
  AuthController authController = AuthController();
  var usernameBaru = TextEditingController();

  // static Future update() async {
  //   User? user = await FirebaseAuth.instance.currentUser;
  //   final userCollection = FirebaseFirestore.instance.collection('users').doc(user!.uid);
  //   final docRef = userCollection.doc(user.);

  // //   try{
  // //     await docRef.update({
  // //       'username':
  // //     })
  // //   }
  // // }

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
                padding: const EdgeInsets.all(8.0),
                child: Text('Username Edit'))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              height: 300, child: Image.asset('assets/images/username.png')),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              controller: authController.usernamebaruController,
              decoration: InputDecoration(
                  hintText: 'Username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Center(
            child: TextButton(
              child: Text('UBAH'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.green,
              ),
              onPressed: () async {
                try {
                  FirebaseAuth.instance.currentUser!
                      .updateDisplayName(authController.usernamebaruController.text);
                } catch (e) {
                  print(e);
                }
                FirebaseAuth.instance.currentUser!
                    .updateDisplayName(authController.usernamebaruController.text);
              },
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => profilePage()));
        },
        child: Icon(
          Icons.arrow_back,
        ),
        backgroundColor: Colors.brown,
      ),
    );
  }
}
