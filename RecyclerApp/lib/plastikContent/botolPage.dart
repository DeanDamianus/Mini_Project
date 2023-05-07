import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/plastik.dart';
import 'package:quantity_input/quantity_input.dart';

class plastikMineralPage extends StatefulWidget {
  const plastikMineralPage({super.key});

  @override
  State<plastikMineralPage> createState() => _plastikMineralPageState();
}

class _plastikMineralPageState extends State<plastikMineralPage> {
  int simpleIntInputMineral = 0;
  int totalHargaMineral = 1000;
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
                child: Text('Plastik Mineral'))
          ],
        ),
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/mineral.png',
                  height: 200,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  'Plastik Mineral',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: const Text('Estimasi Berat (kg): '),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: const Text('Total Harga 1 kg = Rp. 1.000,-'),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: QuantityInput(
                    value: simpleIntInputMineral,
                    onChanged: (value) => setState(() => simpleIntInputMineral =
                        int.parse(value.replaceAll(',', 'KG')))),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: TextButton(
                  child: Text('POST'),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    User? user = FirebaseAuth.instance.currentUser;
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(user!.uid)
                        .collection('orderSampah')
                        .add({
                      "harga": totalHargaMineral * simpleIntInputMineral.toInt(),
                      "berat": simpleIntInputMineral,
                      "jenis": "Air Mineral"
                    }).then((value) {
                      print(value.id);
                      Navigator.pop(context);
                    }).catchError(
                            (error) => print("gagal due to internet error"));
                  },
                ),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => plastikPage()));
        },
        child: Icon(
          Icons.arrow_back,
        ),
        backgroundColor: Colors.brown,
      ),
    );
  }
}
