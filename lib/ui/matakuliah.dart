import 'package:flutter/material.dart';
import 'package:tugas_3/ui/sidemenu.dart';

class Matakuliah extends StatefulWidget {
  const Matakuliah({Key? key}) : super(key: key);

  @override
  _MatakuliahState createState() => _MatakuliahState();
}

class _MatakuliahState extends State<Matakuliah> {
  List<Map<String, String>> matakuliah = [
    {"matakuliah": "Pemrograman Mobile", "semester": "5"},
    {"matakuliah": "Pemrograman Web", "semester": "3"},
    {"matakuliah": "Algoritma dan Pemrograman", "semester": "1"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mata Kuliah"),
      ),
      body: ListView.builder(
        itemCount: matakuliah.length,
        itemBuilder: (context, index) {
          final data = matakuliah[index];
          return Card(
            child: ListTile(
              title: Text(data["matakuliah"]!),
              subtitle: Text("Semester ${data["semester"]!}"),
            ),
          );
        },
      ),
      drawer: const Sidemenu(),
    );
  }
}
