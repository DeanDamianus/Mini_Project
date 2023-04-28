import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/HomePage.dart';
import 'package:mini_project/content.dart';
import 'package:mini_project/logout.dart';

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
              Image.network(
                'https://media.istockphoto.com/id/1162752096/id/vektor/ilustrasi-vektor-tanda-daur-ulang.jpg?s=612x612&w=0&k=20&c=ZqErz5KqKUeicER-S5vg1dBkwEtsAfjLmynx1-edtoQ=',
                fit: BoxFit.contain,
                height: 32,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0), child: Text('Kertas'))
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
                onTap: (){},
                child: Container(
                  height: 100,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0 , 180, 0),
                        child: Text('Koran',style: TextStyle(fontSize: 20),),
                      ),
                      Image.network('https://ouch-cdn2.icons8.com/mJzpDjcP0qZ3-b3151m0Pj690GbEKNVAJ3H1-OOKcao/rs:fit:256:334/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNjI5/LzRjYzlhNTBhLWFm/MWQtNGUzOC1hMzk3/LTU3YmMxNDNhODUy/Ny5zdmc.png',
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
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0 , 140, 0),
                        child: Text('Kardus',style: TextStyle(fontSize: 20),),
                      ),
                      Image.network('https://ouch-cdn2.icons8.com/FtoViLOLPTrg3If-hKdfUhsPfvRAforwdu_JBUsoG48/rs:fit:256:206/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvNzI3/L2VjMWQ3MjcyLTU5/ZTctNGIzNC1iOGJh/LWM3NDZkZjY2ZTVj/Yy5wbmc.png',
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
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0 , 70, 0),
                        child: Text('Kertas Arsip',style: TextStyle(fontSize: 20),),
                      ),
                      Image.network('https://ouch-cdn2.icons8.com/h8n9G-J_qrxOxSDi7PexM75W8oxF8_E-nHphaR6TbHw/rs:fit:256:177/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMzc2/Lzk4ODNjNjAxLWIy/NzEtNDYzZC1hYjFl/LTYxYTZhNzMzOTlk/Yy5zdmc.png',
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
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0 , 160, 0),
                        child: Text('Karton',style: TextStyle(fontSize: 20),),
                      ),
                      Image.network('https://ouch-cdn2.icons8.com/ju12XDUzNwXQmVwMLbXLeV7mflRVnNS9sLteDNrEjGk/rs:fit:256:399/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNTEy/LzE4MDBhMWU0LThl/MjMtNGMwNC1iNDcx/LThkNjAyYjU0MGE5/My5zdmc.png',
                      height: 80,)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
        
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
