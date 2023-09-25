import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_3/ui/home.dart';
import 'package:tugas_3/ui/matakuliah.dart';

class Sidemenu extends StatefulWidget {
  const Sidemenu({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SidemenuState createState() => _SidemenuState();
}

class _SidemenuState extends State<Sidemenu> {
  // ignore: prefer_typing_uninitialized_variables
  var emailUser;
  var namaUser;
  void _loadEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emailUser = prefs.getString('email');
    namaUser = prefs.getString('nama');
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadEmail();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const Image(
                image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
              ),
              accountName:
                  namaUser != null ? Text(namaUser) : const Text("No User"),
              accountEmail:
                  emailUser != null ? Text(emailUser) : const Text("No Email"),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text("Mata Kuliah"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Matakuliah()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
