import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:login_screen/controllers/app_controller.dart';
import 'package:login_screen/controllers/login_controller.dart';
import 'package:login_screen/models/user_repository.dart';
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
          initialBinding: BindingsBuilder(() {
            Get.put<AppController>(AppController());
            Get.put<LoginController>(LoginController());
          })),
    );
  }
}
