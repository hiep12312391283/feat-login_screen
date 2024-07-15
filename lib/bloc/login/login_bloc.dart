import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:login_screen/models/fake_account.dart';
import 'package:login_screen/models/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<TaxCodeChangedEvent>(_onTaxCodeChanged);
    on<AccountChangedEvent>(_onAccountChanged);
    on<PasswordChangedEvent>(_onPaswordChanged);
    on<LoginStartedEvent>(_onLoginStarted);
    on<LoginToggleEyeEvent>(_onLoginToggleEye);
    on<LoginButtonPressedEvent>(_onLoginButtonPressed);
  }

  void _onTaxCodeChanged(TaxCodeChangedEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(
        taxCode: event.taxCode));
  }

  void _onAccountChanged(AccountChangedEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(account: event.account));
  }

  void _onPaswordChanged(PasswordChangedEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onLoginStarted(LoginStartedEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(
        taxCode: event.taxCode,
        account: event.account,
        password: event.password));
  }

  void _onLoginToggleEye(LoginToggleEyeEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(isObscure: !state.isObscure));
  }

  void _onLoginButtonPressed(
      LoginButtonPressedEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading));
    await Future.delayed(const Duration(seconds: 1));
    try {
      if (state.taxCode == FakeAccount.fakeAccount.taxCodeFake &&
          state.account == FakeAccount.fakeAccount.accountFake &&
          state.password == FakeAccount.fakeAccount.passwordFake) {
        emit(state.copyWith(status: LoginStatus.success));
        UserRepository.setLoggedIn(true);
        UserRepository.saveTaxCode(state.taxCode);
        UserRepository.saveAccount(state.account);
        UserRepository.savePassword(state.password);
      } else {
        throw Exception("Lỗi hệ thống");
      }
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.error, error: e.toString()));
    } finally {
      emit(state.copyWith(status: LoginStatus.initial));
    }
  }
}
