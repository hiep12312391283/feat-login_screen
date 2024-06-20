import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:login_screen/screens/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: () async {
          var loginBox = Hive.box('userBox'); 
          await loginBox.put('isLoggedIn', false);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (Route<dynamic> route) => false);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
        child: const Text(
          'Đăng xuất',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ));
  }
}
