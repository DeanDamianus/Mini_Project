import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/HomePage.dart';
import 'package:mini_project/plastikContent/plastik.dart';
import 'package:quantity_input/quantity_input.dart';

class galonAir extends StatefulWidget {
  const galonAir({super.key});

  @override
  State<galonAir> createState() => _galonAirState();
}

class _galonAirState extends State<galonAir> {
  int simpleIntInputGalon = 1;
  int totalhargaGalon = 3000;
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
                padding: const EdgeInsets.all(8.0), child: Text('Galon Air'))
          ],
        ),
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/galon.png',
                  height: 200,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  'Galon Air',
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
                child: const Text('Total Harga 1 kg = Rp. 3.000,-'),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: QuantityInput(
                    value: simpleIntInputGalon,
                    onChanged: (value) => setState(() => simpleIntInputGalon =
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
                       showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Galon"),
                  content: const Text("Apakah anda yakin ingin post?"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text("Terima Kasih!"),
                                  content: const Text("Silahkan Menunggu informasi lebih lanjut dari Driver!"),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 40,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                               User? user = FirebaseAuth.instance.currentUser;
                                FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(user!.uid)
                                    .collection('orderSampah')
                                    .add({
                                  "harga":totalhargaGalon * simpleIntInputGalon.toInt(),
                                  "berat": simpleIntInputGalon,
                                  "jenis": "Galon",
                                  "status": "Delivered.."
                                }).then((value) {
                                  print(value.id);
                                  Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => HomePage()));
                                }).catchError(
                                        (error) => print("gagal due to internet error"));
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(14),
                                              child: const Text("OKE!, DITUNGGU!"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );

                            },
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              child: const Text("Ya"),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          GestureDetector(
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              child: const Text("Tidak"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
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
