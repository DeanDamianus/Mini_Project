import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/backEnd/auth.dart';
import 'package:mini_project/content.dart';
import 'package:mini_project/logout.dart';
import 'package:mini_project/Profile/profile.dart';
import 'main.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "Loading...";
  num total = 0;

  AuthController authController = AuthController();
  User? user = FirebaseAuth.instance.currentUser;

  void getDataName() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    setState(() {
      name = (vari.data() as dynamic)['username'];
    });
  }

  void getTotal() async {
    User? user = FirebaseAuth.instance.currentUser;
    int sum = 0;
    var snapshots = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('orderSampah')
        .get();
    snapshots.docs.forEach((doc) {
      int harga = doc.data()['harga'];
      if (harga is num || harga is double) {
        sum += harga;
      }
    });
    setState(() {
      total = sum;
    });
  }


  void getSampah() async {
    User? user = FirebaseAuth.instance.currentUser;
    var sampah = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('orderSampah')
        .get();
    sampah.docs.forEach((doc) {
      print(doc.data());
    });
  }



  @override
  void initState() {
    getDataName();
    getSampah();
    getTotal();
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
              height: 90,
              child: Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/anonim.png',
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Text(
                                'Hai, ${name}!',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),    
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Text(
                                'Estimasi Pendapatan kamu: Rp.$total,-',
                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                              ),
                )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 4,
              width: double.infinity,
              child: const DecoratedBox(decoration: BoxDecoration(color: Colors.brown)),
            ),
            SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(user!.uid)
                  .collection('orderSampah')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                      child: Container(
                          padding: EdgeInsets.all(40),
                          child: Image.asset('assets/images/notfound.png')));
                }
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, dynamic> data = snapshot.data!.docs[index]
                          .data() as Map<String, dynamic>;
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqQuXQqV3GVJnvk3cs8LN9ubPo3cn3N6c79A&usqp=CAU'),
                          child: Text(
                            data['jenis'].substring(0, 1),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        title: Text(data['jenis'],
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(
                            'Berat: ${data['berat']} kg, Rp.${data['harga']}-, Status: ${data['status']}'),
                      
                          
                      );
                    });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => contentPage()));
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.brown,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => profilePage()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => logoutScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
