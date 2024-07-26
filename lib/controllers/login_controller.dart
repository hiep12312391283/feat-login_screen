import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/models/fake_account.dart';
import 'package:login_screen/models/user_repository.dart';
import 'package:login_screen/views/custom/custom_dialog.dart';
import 'package:login_screen/views/home_page_screen.dart';

class LoginController extends GetxController {
  final taxCodeController = TextEditingController(text: UserRepository.taxCode);
  final accountController = TextEditingController(text: UserRepository.account);
  final passwordController =
      TextEditingController(text: UserRepository.password);
  final formKey = GlobalKey<FormState>();
  final validateMode = AutovalidateMode.disabled.obs;
  final error = Rxn<String>();
  final RxBool isObscure = true.obs;
  final RxBool isLoading = false.obs;
  final RxString taxCode = ''.obs;
  final RxString password = ''.obs;

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
    validateMode.value = AutovalidateMode.always;
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 1));
      try {
        if (taxCodeController.text == FakeAccount.fakeAccount.taxCodeFake &&
            accountController.text == FakeAccount.fakeAccount.accountFake &&
            passwordController.text == FakeAccount.fakeAccount.passwordFake) {
          error.value = null;
          UserRepository.setLoggedIn(true);
          UserRepository.saveTaxCode(taxCodeController.text);
          UserRepository.saveAccount(accountController.text);
          UserRepository.savePassword(passwordController.text);
          Get.offAll(() => const HomePage());
        } else {
          Get.dialog(
              CustomDialog(message: error.value ?? 'Thông tin đăng nhập sai'));
        }
      } catch (e) {
        error.value = e.toString();
      } finally {
        isLoading.value = false;
      }
    }
  }
}
