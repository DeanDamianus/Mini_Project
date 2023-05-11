import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/HomePage.dart';
import 'package:mini_project/besiContent/besi.dart';
import 'package:mini_project/kertasContent/kertas.dart';
import 'package:mini_project/logout.dart';
import 'package:mini_project/plastikContent/plastik.dart';
import 'login.dart';

class contentPage extends StatelessWidget {
  const contentPage({super.key});

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
                  padding: const EdgeInsets.all(8.0), child: Text('Pilih Material'))
            ],
          ),
        ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30,30,0,0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Container(
                    color: Colors.brown,
                    child: Card(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => kertasPage()),
                          );
                        },
                        child: SizedBox(
                          height: 100,
                          width: 140,
                          child: Container(
                            color: Colors.green,
                            child: Image.asset(
                              'assets/images/paper.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    color: Colors.brown,
                    child: Card(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => plastikPage()),
                          );
                        },
                        child: SizedBox(
                          height: 100,
                          width: 140,
                          child: Container(
                            color: Colors.green,
                            child: Image.asset(
                              'assets/images/plastics.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                
                children: <Widget>[
                  Container(
                    color: Colors.brown,
                    child: Card(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => besiPage()),
                          );
                        },
                        child: SizedBox(
                          height: 100,
                          width: 140,
                          child: Container(
                            color: Colors.green,
                            child: Image.asset(
                              'assets/images/steels.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 170,
                  )
                 
                ],
              ),
              SizedBox(
                height: 100),
              Container(
                height: 230,
                child: 
                Image.asset('assets/images/peoples.png'))
            ],
          ),
        



      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Icon(
          Icons.arrow_back,
        ),
        backgroundColor: Colors.brown,
      ),
    );
  }
}
