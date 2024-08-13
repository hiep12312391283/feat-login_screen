import 'package:dio/dio.dart';
import 'package:login_screen/base/hive_service.dart';

class ApiServices {
  final token = HiveService.getToken();
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'https://training-api-unrp.onrender.com', headers: {
      'Content-Type': 'application/json',
      'Authorization': 'token'
    }),
  );
}
