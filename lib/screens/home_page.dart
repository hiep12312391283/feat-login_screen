import 'package:flutter/material.dart';
import 'package:login_screen/models/user_repository.dart';
import 'package:login_screen/providers/app_provider.dart';
import 'package:login_screen/screens/login_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _logout(BuildContext context) async {
    final _appProvider = Provider.of<AppProvider>(context, listen: false);
    // await UserRepository.setLoggedIn(false);
    UserRepository.setLoggedIn(false);
    _appProvider.logout();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: () => _logout(context),
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
