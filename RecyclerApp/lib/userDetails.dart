import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class userDetails extends StatefulWidget {
  final String userId;
  const userDetails({required this.userId, Key? key}) : super(key: key);

  @override
  _userDetailsState createState() => _userDetailsState();
}

class _userDetailsState extends State<userDetails> {
  late CollectionReference orderSampahRef;
  late Query orderSampahQuery;

  @override
  void initState() {
    super.initState();
    orderSampahRef = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userId)
        .collection('orderSampah');
    orderSampahQuery = orderSampahRef.orderBy('jenis');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: orderSampahQuery.snapshots(),
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
              TextEditingController _controller =
                  TextEditingController(text: subData['status']);

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
                subtitle: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: 'Status',
                    hintText: 'Enter the status of the item',
                  ),
                ),
                trailing: ElevatedButton(
                  onPressed: () async {
                    await subDoc.reference.update({
                      'status': _controller.text,
                    });
                  },
                  child: Text('Save'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
