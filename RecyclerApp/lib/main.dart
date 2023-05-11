import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/HomePage.dart';
import 'package:mini_project/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

_init() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("userID");
  if (token != null) {
    Get.offAll(HomePage());
  } else {
    Get.offAll(loginRegister());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        // scaffoldBackgroundColor: Colors.grey,
        useMaterial3: true,
      ),
      home: const _home(),
    );
  }
}

class _home extends StatefulWidget {
  const _home({super.key});

  @override
  State<_home> createState() => __homeState();
}

class __homeState extends State<_home> {
  Future<FirebaseApp> _initialiseFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initialiseFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return loginRegister();
          }
          return const Center(
            child: loginRegister(),
          );
        },
      ),
    );
  }
}
