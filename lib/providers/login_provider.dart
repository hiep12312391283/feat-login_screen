// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:login_screen/models/fake_account.dart';
import 'package:login_screen/models/login_state.dart';
import 'package:login_screen/models/user_repository.dart';

class LoginProvider extends StateNotifier<LoginState> {
  LoginProvider() : super(LoginState());
  void updateState({String? taxCode, String? account, String? password}) {
    state = state.copyWith(
      taxCode: taxCode ?? state.taxCode,
      account: account ?? state.account,
      password: password ?? state.password,
    );
  }
  // void updateState(String taxCode, String account, String password) {
  //   state = state.copyWith(
  //     taxCode: taxCode,
  //     account: account,
  //     password: password,
  //   );
  // }

  // void updateTaxCode(String taxCode) {
  //   state = state.copyWith(taxCode: taxCode);
  // }
  //   void updateAccount(String account) {
  //   state = state.copyWith(account: account);
  // }
  //   void upadatePassword(String password) {
  //   state = state.copyWith(password: password);
  // }

  void toggleEyeIcon() {
    state = state.copyWith(isObscure: !state.isObscure);
  }

  void login() async {
    state = state.copyWith(status: LoginStatus.loading);
    await Future.delayed(const Duration(seconds: 1));
    try {
      if (state.taxCode == FakeAccount.fakeAccount.taxCodeFake &&
          state.account == FakeAccount.fakeAccount.accountFake &&
          state.password == FakeAccount.fakeAccount.passwordFake) {
        state = state.copyWith(status: LoginStatus.success);
        UserRepository.setLoggedIn(true);
        UserRepository.saveTaxCode(state.taxCode);
        UserRepository.saveAccount(state.account);
        UserRepository.savePassword(state.password);
      } else {
        throw Exception("Lỗi hệ thống");
      }
    } catch (e) {
      state = state.copyWith(status: LoginStatus.error, error: e.toString());
    } finally {
      state = state.copyWith(
        status: LoginStatus.initial,
      );
    }
  }
}
