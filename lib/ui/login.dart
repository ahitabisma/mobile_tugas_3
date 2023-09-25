// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_3/ui/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _saveEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', _emailController.text);
    prefs.setString('nama', "Ahita Bisma");
  }

  Widget _showInput(namaController, placeholder, isPassword) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: namaController,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: placeholder,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.all(12),
        ),
      ),
    );
  }

  Future<void> _showDialog(pesan, alamat) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(pesan),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => alamat),
                );
              },
              child: const Text("OK"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.blue, // Change the app bar color
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _showInput(_emailController, "Email", false),
            _showInput(_passwordController, "Password", true),
            ElevatedButton(
              onPressed: () {
                if (_emailController.text == '' &&
                    _passwordController.text == '') {
                  _showDialog(
                      "Masukkan Username dan Password", const LoginPage());
                } else if (_emailController.text == 'bisma@gmail.com' &&
                    _passwordController.text == 'bisma') {
                  _saveEmail();
                  _showDialog("Login Berhasil", const Home());
                } else {
                  _showDialog("Email atau Password salah", const LoginPage());
                }
              },
              child: const Text('Login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Change the button color
                textStyle: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
