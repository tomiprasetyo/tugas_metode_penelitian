import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tugas_metode_penelitian/ui/input_program_studi.dart';

class InputMahasiswa extends StatefulWidget {
  const InputMahasiswa({super.key});

  @override
  State<InputMahasiswa> createState() => _InputMahasiswaState();
}

class _InputMahasiswaState extends State<InputMahasiswa> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  TextEditingController noPendaftaran = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController tempatLahir = TextEditingController();
  TextEditingController tanggalLahir = TextEditingController();
  TextEditingController alamatCalon = TextEditingController();
  TextEditingController asalSekolah = TextEditingController();
  TextEditingController jumlahNEM = TextEditingController();
  TextEditingController jumlahSTTB = TextEditingController();
  TextEditingController namaOrtu = TextEditingController();
  TextEditingController pekerjaanOrtu = TextEditingController();
  TextEditingController alamaOrtu = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Calon Mahasiswa"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20.0),
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
                controller: nama,
                decoration: InputDecoration(
                  labelText: "Input nama anda",
                  icon: const Icon(Icons.person_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextFormField(
                controller: tempatLahir,
                decoration: InputDecoration(
                  labelText: "Tempat Lahir",
                  icon: const Icon(Icons.place_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextFormField(
                controller: tanggalLahir,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  hintText: "yyy-mm-dd",
                  labelText: "Tanggal Lahir",
                  icon: const Icon(Icons.date_range_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextFormField(
                controller: alamatCalon,
                decoration: InputDecoration(
                  labelText: "Alamat Calon Mahasiswa",
                  icon: const Icon(Icons.add_location_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextFormField(
                controller: asalSekolah,
                decoration: InputDecoration(
                  labelText: "Asal Sekolah",
                  icon: const Icon(Icons.school_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextFormField(
                controller: jumlahNEM,
                decoration: InputDecoration(
                  labelText: "Jumlah NEM",
                  icon: const Icon(Icons.toc_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextFormField(
                controller: jumlahSTTB,
                decoration: InputDecoration(
                  labelText: "Jumlah STTB",
                  icon: const Icon(Icons.topic_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextFormField(
                controller: namaOrtu,
                decoration: InputDecoration(
                  labelText: "Nama Orang Tua",
                  icon: const Icon(Icons.person_4_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextFormField(
                controller: pekerjaanOrtu,
                decoration: InputDecoration(
                  labelText: "Pekerjaan Orang Tua",
                  icon: const Icon(Icons.work_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextFormField(
                controller: alamaOrtu,
                decoration: InputDecoration(
                  labelText: "Alamat Orang Tua",
                  icon: const Icon(Icons.location_history_outlined),
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
                  final String dataNoPendaftaran = noPendaftaran.text;
                  final String dataName = nama.text;
                  final String dataTempatLahir = tempatLahir.text;
                  final String dataTanggalLahir = tanggalLahir.text;
                  final String dataAlamat = alamatCalon.text;
                  final String dataAsalSekolah = asalSekolah.text;
                  final String dataJumlahNEM = jumlahNEM.text;
                  final String dataJumlahSTTB = jumlahSTTB.text;
                  final String dataNamaOrtu = namaOrtu.text;
                  final String dataPekerjaanOrtu = pekerjaanOrtu.text;
                  final String dataAlamatOrtu = alamaOrtu.text;

                  try {
                    final response =
                        await firestore.collection('calon_mahasiswa').add({
                      "no_pendaftaran": dataNoPendaftaran,
                      "nama_calon": dataName,
                      "tempat_lahir": dataTempatLahir,
                      "tanggal_lahir": dataTanggalLahir,
                      "alamat_calon": dataAlamat,
                      "asal_sekolah": dataAsalSekolah,
                      "jumlah_nem": dataJumlahNEM,
                      "jumlah_sttb": dataJumlahSTTB,
                      "nama_ortu": dataNamaOrtu,
                      "pekerjaan_ortu": dataPekerjaanOrtu,
                      "alamat_ortu": dataAlamatOrtu
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
                      builder: (context) => const InputProgramStudi(),
                    ),
                  );
                },
                child: const Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
