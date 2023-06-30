import 'package:flutter/material.dart';
import 'package:tugas_metode_penelitian/ui/daftar_pilihan_program_studi.dart';
import 'package:tugas_metode_penelitian/ui/input_mahasiswa.dart';
import 'package:tugas_metode_penelitian/ui/laporan_calon_mahasiswa.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const InputMahasiswa();
                    },
                  ),
                );
              },
              child: const Text("Input Data Siswa"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LaporanCalonMahasiswa();
                    },
                  ),
                );
              },
              child: const Text("Laporan Calon Mahasiswa"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const DaftarPilihanProgramStudi();
                    },
                  ),
                );
              },
              child: const Text("Daftar Pilihan Program Studi"),
            ),
          ],
        ),
      ),
    );
  }
}
