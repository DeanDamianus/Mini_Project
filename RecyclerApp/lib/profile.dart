import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/HomePage.dart';
import 'package:mini_project/logout.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  String name = "";
  void getData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
    setState(() {
      name = (vari.data()as dynamic)['username'];
    });
  }

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
                  padding: const EdgeInsets.all(8.0), child: Text('Profile'))
            ],
          ),
        ),
      body: Column(
        children:[ 
          Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: CircleAvatar(
              radius: 80,
              child: ClipOval(
                  child: Image.asset(
                    'assets/images/anonim.png',
                  ),
              ),
          ),
            ),
          ),
          Container(
            child: Column(children: [
              Text('$name'),

            ]),
          )
        ]),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Icon(
          Icons.arrow_back,
        ),
        backgroundColor: Colors.brown,
      ),
    );
  }
}