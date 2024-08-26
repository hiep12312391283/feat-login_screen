import 'package:dio/dio.dart';
import 'package:login_screen/base/hive_service.dart';

class ApiServices {
  final Dio dio = Dio(
    BaseOptions(
        baseUrl: 'https://training-api-unrp.onrender.com',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': HiveService.getToken()
        },
        validateStatus: (status) {
          return status != null && status < 500;
        }),
  );

}
