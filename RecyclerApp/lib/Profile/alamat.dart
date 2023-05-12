import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class alammatProfile extends StatefulWidget {
  const alammatProfile({Key? key}) : super(key: key);

  @override
  State<alammatProfile> createState() => _alammatProfileState();
}

class _alammatProfileState extends State<alammatProfile> {
  final TextEditingController alamatController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchAlamat();
  }

  Future<void> fetchAlamat() async {
    DocumentSnapshot docSnapshot =
        await FirebaseFirestore.instance.collection('users').doc('your_user_id').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> userData = docSnapshot.data() as Map<String, dynamic>;
      String alamat = userData['alamat'];
      alamatController.text = alamat;
    }
  }

  Future<void> updateAlamat(String alamat) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc('your_user_id')
        .update({'alamat': alamat});
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Alamat updated successfully')),
    );
  }

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
            Container(padding: const EdgeInsets.all(8.0), child: Text('Alamat Edit'))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 300, child: Image.asset('assets/images/driver.png')),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: alamatController,
                decoration: InputDecoration(
                  hintText: 'Alamat Baru',
                  prefixIcon: Icon(Icons.home),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            Center(
              child: TextButton(
                child: Text('UBAH'),
                style: TextButton.styleFrom(primary: Colors.white, backgroundColor: Colors.green),
                onPressed: () async {
                  String newAlamat = alamatController.text.trim();
                  await updateAlamat(newAlamat);
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.brown,
      ),
    );
  }
}
