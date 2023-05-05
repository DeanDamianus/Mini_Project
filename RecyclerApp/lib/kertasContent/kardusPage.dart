import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/HomePage.dart';
import 'package:mini_project/kertas.dart';
import 'package:mini_project/logout.dart';
import 'package:mini_project/plastik.dart';
import 'package:quantity_input/quantity_input.dart';

class kardusPage extends StatefulWidget {
  const kardusPage({super.key});

  @override
  State<kardusPage> createState() => _kardusPageState();
}

class _kardusPageState extends State<kardusPage> {
  int simpleIntInputkardus = 0;
  int totalHargaKardus = 700;
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
            Container(padding: const EdgeInsets.all(8.0), child: Text('Kardus'))
          ],
        ),
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/kardus.png',
                  height: 200,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Kardus',
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
                child: const Text('Total Harga 1 kg = Rp. 700,-'),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: QuantityInput(
                    value: simpleIntInputkardus,
                    onChanged: (value) => setState(() => simpleIntInputkardus =
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
                  onPressed: () async {
                    FirebaseFirestore.instance.collection('pesananSampah').add({
                      "harga": totalHargaKardus * simpleIntInputkardus.toInt(),
                      "berat": simpleIntInputkardus,
                      "jenis": "Kardus"
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
              context, MaterialPageRoute(builder: (context) => kertasPage()));
        },
        child: Icon(
          Icons.arrow_back,
        ),
        backgroundColor: Colors.brown,
      ),
    );
  }
}
