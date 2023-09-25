// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_3/ui/matakuliah.dart';
import 'sidemenu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var namaUser;
  var emailUser;

  @override
  void initState() {
    super.initState();
    _loadNamaUser();
  }

  void _loadNamaUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    namaUser = prefs.getString('nama');
    emailUser = prefs.getString('email');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: ListView(
        children: [
          ListTile(
              title: Text("Welcome $namaUser",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Text("Nama : ", style: TextStyle(fontSize: 20)),
                Text("$namaUser", style: TextStyle(fontSize: 20))
              ]),
              Row(children: [
                Text("Semester : ", style: TextStyle(fontSize: 20)),
                Text("5", style: TextStyle(fontSize: 20))
              ]),
              Row(children: [
                Text("Email : ", style: TextStyle(fontSize: 20)),
                Text("$emailUser", style: TextStyle(fontSize: 20))
              ]),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Matakuliah()));
              },
              child: Text("Lihat Mata Kuliah"))
        ],
      ),
      drawer: const Sidemenu(),
    );
  }
}
