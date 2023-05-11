import 'package:flutter/material.dart';
import 'package:mini_project/Profile/profile.dart';

class alammatProfile extends StatefulWidget {
  const alammatProfile({super.key});

  @override
  State<alammatProfile> createState() => _alammatProfileState();
}

class _alammatProfileState extends State<alammatProfile> {
  final TextEditingController alamat = TextEditingController();

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
                child: Text('Alamat Edit'))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              height: 300, child: Image.asset('assets/images/driver.png')),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              controller: alamat,
              decoration: InputDecoration(
                  hintText: 'Alamat Baru',
                  prefixIcon: Icon(Icons.home),
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