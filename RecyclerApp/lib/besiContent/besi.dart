import 'package:flutter/material.dart';
import 'package:mini_project/besiContent/alumuniumPage.dart';
import 'package:mini_project/besiContent/besiPage.dart';
import 'package:mini_project/besiContent/kalengPage.dart';
import 'package:mini_project/content.dart';

class besiPage extends StatelessWidget {
  const besiPage({super.key});

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
              children: <Widget>[
                SizedBox(
                  height: 90,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BesiIsi()));
                  },
                  child: Container(
                    height: 100,
                    width: 350,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 0, 130, 0),
                          child: Text(
                            'Besi',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Image.asset(
                          'assets/images/besy.png',
                          height: 130,
                        )
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
                        MaterialPageRoute(builder: (context) => kalengPage()));
                  },
                  child: Container(
                    height: 100,
                    width: 350,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 0, 95, 0),
                          child: Text(
                            'Kaleng',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Image.asset(
                          'assets/images/kaleng.jpg',
                          height: 100,
                        )
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
                        MaterialPageRoute(builder: (context) => alumuniumPage()));
                  },
                  child: Container(
                    height: 100,
                    width: 350,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 0, 70, 0),
                          child: Text(
                            'Aluminium',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Image.asset(
                          'assets/images/pot.jpg',
                          height: 150,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              
                
              ],
            ),

          ),
          Center(
            child: Container(
                    child: Image.asset(
                      'assets/images/gear.png',
                      height: 180,
                      alignment: Alignment.bottomLeft,
                    ),
                  ),
          )
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