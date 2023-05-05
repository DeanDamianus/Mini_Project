import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/HomePage.dart';
import 'package:mini_project/content.dart';
import 'package:mini_project/logout.dart';
import 'package:mini_project/plastikContent/botolPage.dart';
import 'package:mini_project/plastikContent/galonAir.dart';
import 'package:mini_project/plastikContent/plasticCup.dart';
import 'login.dart';

class plastikPage extends StatelessWidget {
  const plastikPage({super.key});

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
       body: Center(
          child: Column(
            children: <Widget>  [
              SizedBox(
                height:90,
              ),
              GestureDetector(
                onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => plastikMineralPage()));
                  },
                child: Container(
                  height: 100,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0 , 80, 0),
                        child: Text('Plastik Mineral',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      Image.asset('assets/images/mineral.png',
                      height: 80,)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => plasticCupPage()));
                  },
                child: Container(
                  height: 100,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 3
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0 , 100, 0),
                        child: Text('Plastik Cup',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      Image.asset('assets/images/plasticCup.png',
                      height: 80,)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => galonAir()));
                  },
                child: Container(
                  height: 100,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 3
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0 , 110, 0),
                        child: Text('Galon Air',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      Image.asset('assets/images/galon.png',
                      height: 80,)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset('assets/images/waste.png',
              height: 160,)
        
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => contentPage()));
        },
        child: Icon(
          Icons.arrow_back,
        ),
        backgroundColor: Colors.brown,
      ),
);
  }
}
