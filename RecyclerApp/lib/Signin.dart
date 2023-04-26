import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/HomePage.dart';
import 'package:mini_project/login.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernamebaruController = TextEditingController();
  TextEditingController emailbaruController = TextEditingController();
  TextEditingController passwordbaruController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://media.istockphoto.com/id/1162752096/id/vektor/ilustrasi-vektor-tanda-daur-ulang.jpg?s=612x612&w=0&k=20&c=ZqErz5KqKUeicER-S5vg1dBkwEtsAfjLmynx1-edtoQ=',
                fit: BoxFit.contain,
                height: 32,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0), child: Text('Re-Cycler'))
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: Image.network(
                  'https://img.freepik.com/free-vector/waste-management-concept-illustration_114360-8725.jpg',
                  height: 250,
                  fit: BoxFit.fitWidth,
                )),
                SizedBox(
                  height: 10,),
                TextFormField(
                  controller: usernamebaruController,
                  decoration: InputDecoration(hintText: 'Username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailbaruController,
                  decoration: InputDecoration(hintText: 'Email',
                  prefixIcon: Icon(Icons.email_rounded),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)))
                  ,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordbaruController,
                  decoration: InputDecoration(hintText: 'Password',
                  prefixIcon: Icon(Icons.password_sharp),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                  obscureText: true,
                ),
                SizedBox(
                  height: 30,
                ),
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
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailbaruController.text,
                              password: passwordbaruController.text)
                          .then((value) {
                        print('Created New Account');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }).onError((error, stackTrace) {
                        print('Error ${error.toString()}');
                      });
                    },
                    child: Text(
                      "Sign-Me Up!",
                      style: TextStyle(
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,),
                Column(
                      children: [
                        const Text(
                          "Already Having an account? ",
                          style: TextStyle(color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => loginRegister()));
                          },
                          child: const Text(
                            'Sign in!',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  
                
              ],
            ),
          ),
        ));
  }
}
