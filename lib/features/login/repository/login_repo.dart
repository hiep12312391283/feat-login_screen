import 'package:get/get.dart';
import 'package:login_screen/base/api_services.dart';
import 'package:login_screen/features/login/models/login_request.dart';
import 'package:login_screen/features/login/models/login_response.dart';

class LoginRepo {
  final ApiServices apiServices = Get.find();
  Future<LoginResponse> login(LoginRequest request) async {
    final body = request.toJson();
    final response = await apiServices.dio.post('/login', data: body);
    return LoginResponse.fromJson(response.data);
  }
}
