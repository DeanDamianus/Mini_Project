import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/HomePage.dart';
import 'package:mini_project/content.dart';
import 'package:mini_project/logout.dart';
import 'login.dart';

class kertasPage extends StatelessWidget {
  const kertasPage({super.key});

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
        body: Column(
          children: [
            Center(
              child: Column(
                children: <Widget>  [
                  SizedBox(
                    height:90,
                  ),
                  GestureDetector(
                    onTap: (){},
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
                            padding: EdgeInsets.fromLTRB(30, 0 , 150, 0),
                            child: Text('Koran',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          ),
                          Image.asset('assets/images/koran.png',
                          height: 80,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap:(){},
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
                            padding: EdgeInsets.fromLTRB(30, 0 , 120, 0),
                            child: Text('Kardus',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          ),
                          Image.asset('assets/images/kardus.png',
                          height: 80,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: (){},
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
                            padding: EdgeInsets.fromLTRB(30, 0 , 55, 0),
                            child: Text('Kertas Arsip',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          ),
                          Image.asset('assets/images/papers.png',
                          height: 80,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: (){},
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
                            padding: EdgeInsets.fromLTRB(30, 0 , 145, 0),
                            child: Text('Karton',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          ),
                          Image.asset('assets/images/susu.png',
                          height: 80,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  Container(child: 
                  Image.asset('assets/images/airplane.png',
                  height: 70,
                  alignment: Alignment.bottomLeft,),)
            
                ],
              ),
            ),
          ],
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
