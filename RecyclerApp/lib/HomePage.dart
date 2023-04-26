import 'package:flutter/material.dart';
import 'login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  //       appBar: AppBar(
  //         title: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //                 Image.network(
  //                'https://media.istockphoto.com/id/1162752096/id/vektor/ilustrasi-vektor-tanda-daur-ulang.jpg?s=612x612&w=0&k=20&c=ZqErz5KqKUeicER-S5vg1dBkwEtsAfjLmynx1-edtoQ=',
  //                 fit: BoxFit.contain,
  //                 height: 32,
  //             ),
  //             Container(
  //                 padding: const EdgeInsets.all(8.0), child: Text('Re-Cycler'))
  //           ],

  //         ),
  // ),
      body: Center(
        child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                
                    width: 250,
                    height: 45,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => loginRegister()));
                      },
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      )
    );
  }
}