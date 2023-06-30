import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:tugas_metode_penelitian/ui/home.dart';

class PilihanProgramStudi extends StatefulWidget {
  const PilihanProgramStudi({super.key});

  @override
  State<PilihanProgramStudi> createState() => _PilihanProgramStudiState();
}

class _PilihanProgramStudiState extends State<PilihanProgramStudi> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController noPendaftaran = TextEditingController();
  TextEditingController kodePS = TextEditingController();
  TextEditingController tanggalPendaftaran = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pilihan Program Studi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: noPendaftaran,
              decoration: InputDecoration(
                labelText: "No Pendaftaran",
                icon: const Icon(Icons.numbers_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextFormField(
              controller: kodePS,
              decoration: InputDecoration(
                labelText: "Kode Program Studi",
                icon: const Icon(Icons.code),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextFormField(
              controller: tanggalPendaftaran,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                hintText: "yyy-mm-dd",
                labelText: "Tanggal Pendaftaran",
                icon: const Icon(Icons.date_range_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            ElevatedButton(
              onPressed: () async {
                final String dataTanggalPdf = tanggalPendaftaran.text;
                final String dataNoPdf = noPendaftaran.text;
                final String dataKodePS = kodePS.text;

                try {
                  final response =
                      await firestore.collection('pilihan_program_studi').add({
                    "tanggal_pendaftaran": dataTanggalPdf,
                    "no_pendaftaran": dataNoPdf,
                    "kode_program_studi": dataKodePS
                  });

                  print(response);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to add data: $e')),
                  );
                }

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const Home();
                    },
                  ),
                );
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
