import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/HomePage.dart';
import 'package:mini_project/kertas.dart';
import 'package:mini_project/logout.dart';
import 'package:mini_project/plastik.dart';
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
            Image.network(
              'https://media.istockphoto.com/id/1162752096/id/vektor/ilustrasi-vektor-tanda-daur-ulang.jpg?s=612x612&w=0&k=20&c=ZqErz5KqKUeicER-S5vg1dBkwEtsAfjLmynx1-edtoQ=',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('Re-Cycler'))
          ],
        ),
      ),
      body: Container(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => kertasPage()));
              },
              child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.brown,
                  child: Container(
                    color: Colors.green,
                    child: Image.network(
                      'https://ouch-cdn2.icons8.com/lqn1lVXos-_Ie3Rjiwwg9xGilkswH8vj8uMxjai02OM/rs:fit:256:253/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvODYz/LzZiMTQ3N2FlLTY1/MmItNGY0Yy1hYjg2/LTY2MzIyYmQ0MGUz/YS5zdmc.png',
                    ),
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => plastikPage()));
              },
              child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.brown,
                  child: Container(
                    color: Colors.green,
                    child: Image.network(
                      'https://ouch-cdn2.icons8.com/hkurf0IOdg8rQ9piRU7enMWYYADh_Y5x_J33bybGpLQ/rs:fit:256:593/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvODMx/LzE4NDk0NzI1LTdi/YmYtNDM5NS1hZjUz/LWI2Njk5MGVkMjI2/Ny5zdmc.png',
                    ),
                  )),
            ),
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
