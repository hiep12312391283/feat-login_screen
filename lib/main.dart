import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:login_screen/base/hive_service.dart';
import 'package:login_screen/features/app/binding/global_binding.dart';
import 'package:login_screen/features/app/ui/splash_screen.dart';
import 'package:login_screen/features/home/ui/home_page_screen.dart';
import 'package:login_screen/features/login/binding/login_binding.dart';
import 'package:login_screen/features/login/ui/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await HiveService.init();

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
          getPages: [
            GetPage(
                name: '/login',
                page: () => const LoginView(),
                binding: LoginBinding()),
            GetPage(
                name: '/home',
                page: () => HomePage(),
                binding: GlobalBinding()),
          ]),
    );
  }
}
