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
  String _email = "";
  String _nohp = "";
  void getDatausername() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    setState(() {
      name = (vari.data() as dynamic)['username'];
    });
  }

  void getDataemail() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    setState(() {
      _email = (vari.data() as dynamic)['email'];
    });
  }

  void getDatanomorhp() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    setState(() {
      _nohp = (vari.data() as dynamic)['nomorHp'];
    });
  }

  void initState() {
    getDatausername();
    getDataemail();
    getDatanomorhp();
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
      body: SingleChildScrollView(
        child: Column(children: [
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
            padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
            child: Row(children: [
              Text(
                'Username',
                style: TextStyle(
                    color: Color.fromRGBO(88, 87, 88, 1),
                    fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: (){

                } ,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20,0,0,0),
                  child: Icon(Icons.edit,size: 20,)),
              )
            ]),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 0, 0, 40),
            child: Row(children: [
              Text(
                '$name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              
            ]),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Row(children: [
              Text(
                'E-Mail',
                style: TextStyle(
                    color: Color.fromRGBO(88, 87, 88, 1),
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 0, 0, 40),
            child: Row(children: [
              Text(
                '$_email',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              
            ]),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Row(children: [
              Text(
                'Nomor HP',
                style: TextStyle(
                    color: Color.fromRGBO(88, 87, 88, 1),
                    fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: (){

                } ,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20,0,0,0),
                  child: Icon(Icons.edit,size: 20,)),
              )
              
            ]),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 0, 0, 40),
            child: Row(children: [
              Text(
                '$_nohp',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            
            ]),
          ),
        ]),
      ),
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
