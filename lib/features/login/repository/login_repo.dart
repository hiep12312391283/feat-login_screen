import 'package:get/get.dart';
import 'package:login_screen/base/api_services.dart';
import 'package:login_screen/base/hive_service.dart';
import 'package:login_screen/features/login/models/login_request.dart';
import 'package:login_screen/features/login/models/login_response.dart';

class LoginRepo {
  final ApiServices apiServices = Get.find();
  Future<LoginResponse> login(LoginRequest request) async {
    final body = request.toJson();
    try {
      final response = await apiServices.dio.post('/login', data: body);
      if (response.statusCode == 200) {
        final token = response.data['token'];
        if (token != null) {
          await HiveService.saveToken(token);
          print('Token is ${response.data}');
        }
        return LoginResponse.fromJson(response.data);
      } else {
        print('Login failed: ${response.data}');
        return LoginResponse.fromJson({
          'success': false,
          'message': response.data['message'],
          'token': null
        });
      }
    } catch (e) {
      print(e);
      return LoginResponse(
          success: false,
          message: 'Đã xảy ra lỗi khi kết nối đến máy chủ.',
          token: null);
    }
  }
}
