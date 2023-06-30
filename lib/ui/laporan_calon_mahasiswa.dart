import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LaporanCalonMahasiswa extends StatefulWidget {
  const LaporanCalonMahasiswa({super.key});

  @override
  State<LaporanCalonMahasiswa> createState() => _LaporanCalonMahasiswaState();
}

class _LaporanCalonMahasiswaState extends State<LaporanCalonMahasiswa> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var collectionReference =
      FirebaseFirestore.instance.collection('calon_mahasiswa').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Calon Mahasiswa'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: collectionReference,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          // Get the DocumentSnapshot
          QuerySnapshot querySnapshot = snapshot.data!;
          // Convert the QuerySnapshot to a list of documents
          List<DocumentSnapshot> docs = querySnapshot.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              // Get the document data
              Map<String, dynamic> data =
                  docs[index].data()! as Map<String, dynamic>;

              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: data.keys.map((key) {
                      return Text(
                        '$key: ${data[key]}',
                        style: const TextStyle(fontSize: 16),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
