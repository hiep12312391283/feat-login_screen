import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/data_sources/api_services.dart';
import 'package:login_screen/models/hive_service.dart';
import 'package:login_screen/models/user.dart';
import 'package:login_screen/views/custom/custom_dialog.dart';

class LoginController extends GetxController {
  final taxCodeController = TextEditingController(text: HiveService.taxCode);
  final accountController = TextEditingController(text: HiveService.account);
  final passwordController = TextEditingController(text: HiveService.password);
  final formKey = GlobalKey<FormState>();
  final validateMode = AutovalidateMode.disabled.obs;
  final error = Rxn<String>();
  final RxBool isObscure = true.obs;
  final RxBool isLoading = false.obs;
  final RxString taxCode = ''.obs;
  final RxString password = ''.obs;
  final ApiServices apiServices = ApiServices();

  void toggleEyeIcon() {
    isObscure.value = !isObscure.value;
  }

  void setTaxCode(String taxCodeChanged) {
    taxCode.value = taxCodeChanged;
  }

  void setPassword(String passWordChanged) {
    password.value = passWordChanged;
  }

  void login() async {
    String taxCodeString = taxCodeController.text;
    int taxCode = int.parse(taxCodeString);
    User user = User(
        taxCodeAuth: taxCode,
        accountAuth: accountController.text,
        passwordAuth: passwordController.text);
    validateMode.value = AutovalidateMode.always;
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 1));
      try {
        bool loginSuccess = await apiServices.requestApi(user);
        if (loginSuccess) {
          error.value = null;
          HiveService.setLoggedIn(true);
          HiveService.saveTaxCode(taxCodeController.text);
          HiveService.saveAccount(accountController.text);
          HiveService.savePassword(passwordController.text);
          Get.offAllNamed('/home');
        }
        else {
          throw Exception('thông tin đăng nhập không đúng');
        }
      } catch (e) {
        Get.dialog(CustomDialog(
            message: error.value ?? 'Thông tin đăng nhập không chính xác'));
        error.value = e.toString();
      } finally {
        isLoading.value = false;
      }
    }
  }
}
