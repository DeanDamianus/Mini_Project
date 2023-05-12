import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class userDetails extends StatelessWidget {
  final String userId;
  const userDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('orderSampah')
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Container(
                padding: EdgeInsets.all(40),
                child: Image.asset('assets/images/notfound.png'),
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              QueryDocumentSnapshot subDoc = snapshot.data!.docs[index];
              Map<String, dynamic> subData =
                  subDoc.data() as Map<String, dynamic>;
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqQuXQqV3GVJnvk3cs8LN9ubPo3cn3N6c79A&usqp=CAU',
                  ),
                  child: Text(
                    subData['jenis'].substring(0, 1),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                title: Text(
                  subData['jenis'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Berat: ${subData['berat']} kg, Rp.${subData['harga']}-, Status: ${subData['status']}',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
