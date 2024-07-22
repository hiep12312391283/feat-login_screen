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
  var validateMode = AutovalidateMode.disabled.obs;
  var status = LoginStatus.initial.obs;
  var error = Rxn<String>();
  var isObscure = true.obs;
  var taxCode = ''.obs;
  var account = ''.obs;
  var password = ''.obs;

  @override
  void onInit() {
    super.onInit();
    updateLogin(
        taxCode: taxCodeController.text,
        account: accountController.text,
        password: passwordController.text);
    ever(status, (_) => listenLoginStatus());
  }

  void listenLoginStatus() {
    print("Login status: ${status.value}");
    switch (status.value) {
      case LoginStatus.success:
        Get.offAll(() => const HomePage());
        break;
      case LoginStatus.error:
        Get.dialog(
          CustomDialog(
              message: error.value ?? "Thông tin đăng nhập không chính xác"),
        );
        break;
      default:
        break;
    }
  }

  @override
  void onClose() {
    taxCodeController.dispose();
    accountController.dispose();
    passwordController.dispose();
  }

  void updateLogin({String? taxCode, String? account, String? password}) {
    if (taxCode != null) {
      this.taxCode.value = taxCode;
    }
    if (account != null) {
      this.account.value = account;
    }
    if (password != null) {
      this.password.value = password;
    }
  }

  void toggleEyeIcon() {
    isObscure.value = !isObscure.value;
  }

  void login() async {
    validateMode.value = AutovalidateMode.always;
    if (formKey.currentState!.validate()) {
      status.value = LoginStatus.loading;
      await Future.delayed(const Duration(seconds: 1));
      try {
        if (taxCode.value == FakeAccount.fakeAccount.taxCodeFake &&
            account.value == FakeAccount.fakeAccount.accountFake &&
            password.value == FakeAccount.fakeAccount.passwordFake) {
          status.value = LoginStatus.success;
          error.value = null;
          UserRepository.setLoggedIn(true);
          UserRepository.saveTaxCode(taxCode.value);
          UserRepository.saveAccount(account.value);
          UserRepository.savePassword(password.value);
        } else {
          status.value = LoginStatus.error;
        }
      } catch (e) {
        error.value = e.toString();
      } finally {
        status.value = LoginStatus.initial;
      }
    }
  }
}

enum LoginStatus {
  initial,
  loading,
  success,
  error;
}
