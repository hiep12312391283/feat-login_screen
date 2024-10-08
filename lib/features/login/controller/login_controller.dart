import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/base/hive_service.dart';
import 'package:login_screen/features/app/ui/custom/custom_dialog.dart';
import 'package:login_screen/features/login/models/login_request.dart';
import 'package:login_screen/features/login/repository/login_repo.dart';

class LoginController extends GetxController {
  final taxCodeController = TextEditingController(text: HiveService.taxCode);
  final accountController = TextEditingController(text: HiveService.account);
  final passwordController = TextEditingController(text: HiveService.password);
  final formKey = GlobalKey<FormState>();
  final validateMode = AutovalidateMode.disabled.obs;
  final RxBool isObscure = true.obs;
  final RxBool isLoading = false.obs;
  final RxString taxCode = ''.obs;
  final RxString password = ''.obs;
  final LoginRepo loginRepo = Get.find();
  void toggleEyeIcon() {
    isObscure.value = !isObscure.value;
  }

  void setTaxCode(String taxCodeChanged) {
    taxCode.value = taxCodeChanged;
  }

  void setPassword(String passWordChanged) {
    password.value = passWordChanged;
  }

  Future<void> login() async {
    LoginRequest loginRequest = LoginRequest(
        taxCode: int.tryParse(taxCodeController.text) ?? 0,
        userName: accountController.text,
        password: passwordController.text);
    validateMode.value = AutovalidateMode.always;
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 1));
      try {
        final loginResponse = await loginRepo.login(loginRequest);
        if (loginResponse.success) {
          await HiveService.setLoggedIn(true);
          if (loginResponse.token != null) {
            await HiveService.saveToken(loginResponse.token!);
          }
          HiveService.saveTaxCode(taxCodeController.text);
          HiveService.saveAccount(accountController.text);
          HiveService.savePassword(passwordController.text);
          Get.offAllNamed('/home');
        } else {
          Get.dialog(const CustomDialog(
              message: "Thông tin đăng nhập không chính xác"));
        }
      } catch (e) {
        Get.dialog(CustomDialog(message: "Đã xảy ra lỗi: ${e.toString()}"));
      } finally {
        isLoading.value = false;
      }
    }
  }
}
