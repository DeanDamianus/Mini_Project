import 'package:flutter/material.dart';
import 'package:mini_project/Profile/profile.dart';

class nomorHp extends StatefulWidget {
  const nomorHp({super.key});

  @override
  State<nomorHp> createState() => _nomorHpState();
}

class _nomorHpState extends State<nomorHp> {
  final TextEditingController nomorHp = TextEditingController();
  
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
                padding: const EdgeInsets.all(8.0),
                child: Text('Nomor Hp Edit'))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              height: 300, child: Image.asset('assets/images/mailman.png')),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              controller: nomorHp,
              decoration: InputDecoration(
                  hintText: 'Nomor Hp',
                  prefixIcon: Icon(Icons.phone_android),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Center(
            child: TextButton(
              child: Text('UBAH'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.green,
              ),
              onPressed: () async {
                
              },
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => profilePage()));
        },
        child: Icon(
          Icons.arrow_back,
        ),
        backgroundColor: Colors.brown,
      ),
    );
  }
}