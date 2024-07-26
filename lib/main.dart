import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:login_screen/binding/global_binding.dart';
import 'package:login_screen/binding/login_binding.dart';
import 'package:login_screen/models/user_repository.dart';
import 'package:login_screen/views/login_screen.dart';
import 'package:login_screen/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await UserRepository.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          initialBinding: GlobalBinding(),
          initialRoute: '/login',
          getPages: [
            GetPage(
                name: '/login',
                page: () => const LoginView(),
                binding: LoginBinding())
          ]),
    );
  }
}
