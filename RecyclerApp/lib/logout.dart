import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/HomePage.dart';
import 'login.dart';

class logoutScreen extends StatelessWidget {
  const logoutScreen({super.key});

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
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 45,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()));
                  },
                  child: Text(
                    "Kembali",
                    style: TextStyle(
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 250,
                height: 45,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      print("Signed Out");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => loginRegister()));
                    });
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
);
  }
}
