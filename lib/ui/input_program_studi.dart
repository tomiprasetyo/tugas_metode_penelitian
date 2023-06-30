import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tugas_metode_penelitian/ui/pilihan_program_studi.dart';

class InputProgramStudi extends StatefulWidget {
  const InputProgramStudi({super.key});

  @override
  State<InputProgramStudi> createState() => _InputProgramStudiState();
}

class _InputProgramStudiState extends State<InputProgramStudi> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController noPendaftaran = TextEditingController();
  TextEditingController kodePS = TextEditingController();
  TextEditingController namaPS = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Program Studi"),
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
              controller: namaPS,
              decoration: InputDecoration(
                labelText: "Nama Program Studi",
                icon: const Icon(Icons.notification_important_outlined),
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
                final String dataNoPS = noPendaftaran.text;
                final String dataKodePS = kodePS.text;
                final String dataNamaPS = namaPS.text;

                try {
                  final response =
                      await firestore.collection('program_studi').add({
                    "no_pendaftaran": dataNoPS,
                    "kode_program_studi": dataKodePS,
                    "nama_program_studi": dataNamaPS
                  });

                  print(response);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to add data: $e')),
                  );
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const PilihanProgramStudi();
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
