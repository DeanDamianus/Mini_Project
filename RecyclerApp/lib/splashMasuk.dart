import 'package:flutter/material.dart';
import 'package:mini_project/HomePage.dart';
import 'package:mini_project/login.dart';

class splashMasuk extends StatefulWidget {
  const splashMasuk({super.key});

  @override
  State<splashMasuk> createState() => _splashMasukState();
}

class _splashMasukState extends State<splashMasuk> {
   @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1600), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [Image.network(
              'https://media.istockphoto.com/id/1162752096/id/vektor/ilustrasi-vektor-tanda-daur-ulang.jpg?s=612x612&w=0&k=20&c=ZqErz5KqKUeicER-S5vg1dBkwEtsAfjLmynx1-edtoQ=',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('Re-Cycler'))

          ],
        ),
      ),
    );
  }
}