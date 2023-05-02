import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/HomePage.dart';
import 'package:mini_project/login.dart';
import 'package:mini_project/splash.dart';
import 'package:mini_project/splashMasuk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
