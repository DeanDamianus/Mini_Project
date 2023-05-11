import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/HomePage.dart';
import 'package:mini_project/register.dart';
import 'backEnd/auth.dart';

class loginRegister extends StatefulWidget {
  const loginRegister({super.key});

  @override
  State<loginRegister> createState() => _loginRegisterState();
}

class _loginRegisterState extends State<loginRegister> {
  AuthController authController = AuthController();


  
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
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: Image.asset(
                  'assets/images/login.png',
                  height: 350,
                  fit: BoxFit.fitWidth,
                )),
                //EMAIL
                TextFormField(
                  controller: authController.emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email_rounded),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //PASSWORD
                TextFormField(
                  controller: authController.passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.password_sharp),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
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
                    onPressed: () async {
                      authController.signIn();
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Center(
                    child: Row(
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}