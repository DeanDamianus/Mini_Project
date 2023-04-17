import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
  'Notes App',
  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),
),
      ),
      body: Column(
        children: [
          Container(
            child: Center(
              child: Text('')
            ),
          ),
          Container(
            child: ElevatedButton(onPressed: (){},child: Text('+')),
          )
        ],
      
      )
    );
  }
}