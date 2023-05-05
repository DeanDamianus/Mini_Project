import 'package:flutter/material.dart';
import 'package:mini_project/plastik.dart';
import 'package:quantity_input/quantity_input.dart';

class galonAir extends StatefulWidget {
  const galonAir({super.key});

  @override
  State<galonAir> createState() => _galonAirState();
}

class _galonAirState extends State<galonAir> {
  int simpleIntInputGalon = 0;
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
            Center(child: Image.asset('assets/images/galon.png',
            height: 200,),),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text('Galon Air', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
                  onChanged: (value) => setState(() => simpleIntInputGalon = int.parse(value.replaceAll(',', 'KG')))
                ),),
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
                },
              
              ),
            )
          ],
        )
      ),
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