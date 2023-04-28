import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/HomePage.dart';
import 'package:mini_project/content.dart';
import 'package:mini_project/logout.dart';
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
              Image.network(
                'https://media.istockphoto.com/id/1162752096/id/vektor/ilustrasi-vektor-tanda-daur-ulang.jpg?s=612x612&w=0&k=20&c=ZqErz5KqKUeicER-S5vg1dBkwEtsAfjLmynx1-edtoQ=',
                fit: BoxFit.contain,
                height: 32,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0), child: Text('Plastik'))
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
                      Image.network('https://ouch-cdn2.icons8.com/mvuAM5gLkteoCcEK13LxGo8mlWVyIHms35HLNa2dTTc/rs:fit:256:566/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvNjM3/LzZiMDgyNTM2LTZj/NDItNGE3Ny05N2Uz/LWU5MmJmM2E2NGM2/Yy5wbmc.png',
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
                        padding: EdgeInsets.fromLTRB(30, 0 , 100, 0),
                        child: Text('Plastik Cup',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      Image.network('https://ouch-cdn2.icons8.com/gY4niWrJJAy45nAQiLEYV6rMOZMrGN_k8EzkutjV1Kc/rs:fit:256:414/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMTY1/LzMzYzk5NGUxLWU4/YTctNDAwZi05NWZm/LTA5MTRjYTBmZTNm/MS5zdmc.png',
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
                        padding: EdgeInsets.fromLTRB(30, 0 , 110, 0),
                        child: Text('Galon Air',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      Image.network('https://png.pngtree.com/png-vector/20230124/ourmid/pngtree-gallons-of-water-illustration-png-image_6572748.png',
                      height: 80,)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Image.network('https://img.freepik.com/free-vector/bright-plastic-waste-flat-illustrations-collection_74855-16764.jpg',
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
