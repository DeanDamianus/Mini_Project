import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/kertas.dart';
import 'package:quantity_input/quantity_input.dart';

class kartonPage extends StatefulWidget {
  const kartonPage({super.key});

  @override
  State<kartonPage> createState() => _kartonPageState();
}

class _kartonPageState extends State<kartonPage> {
  int simpleIntInputkarton = 0;
  int totalHargaKarton = 500;
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
            Container(padding: const EdgeInsets.all(8.0), child: Text('Karton'))
          ],
        ),
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/susu.png',
                  height: 200,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Karton',
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
                child: const Text('Total Harga 1 kg = Rp. 500,-'),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: QuantityInput(
                    value: simpleIntInputkarton,
                    onChanged: (value) => setState(() => simpleIntInputkarton =
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
                      User? user = FirebaseAuth.instance.currentUser;
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(user!.uid)
                          .collection('orderSampah')
                          .add({
                        "harga":
                            totalHargaKarton * simpleIntInputkarton.toInt(),
                        "berat": simpleIntInputkarton,
                        "jenis": "Karton"
                      }).then((value) {
                        print(value.id);
                        Navigator.pop(context);
                      }).catchError(
                              (error) => print("gagal due to internet error"));
                    }),
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
