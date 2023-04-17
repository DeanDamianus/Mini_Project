import 'package:flutter/material.dart';
import 'package:notes/HomePage.dart';

void main() {
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
      home: const HomePage(),
    );
  }
}