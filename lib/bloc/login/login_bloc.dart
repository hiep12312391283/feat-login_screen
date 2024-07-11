import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_screen/models/fake_account.dart';
import 'package:login_screen/models/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<TaxCodeChanged>(_onTaxCodeChanged);
    on<AccountChanged>(_onAccountChanged);
    on<PasswordChanged>(_onPaswordChanged);
    on<LoginStarted>(_onLoginStarted);
    on<LoginToggleEye>(_onLoginToggleEye);
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  void _onTaxCodeChanged(TaxCodeChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(taxCode: event.taxCode, showCloseIcon: event.taxCode.isNotEmpty));
  }

  void _onAccountChanged(AccountChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(account: event.account));
  }

  void _onPaswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onLoginStarted(LoginStarted event, Emitter<LoginState> emit) {
    emit(state.copyWith(
        taxCode: event.taxCode,
        account: event.account,
        password: event.password));
  }

  void _onLoginToggleEye(LoginToggleEye event, Emitter<LoginState> emit) {
    emit(state.copyWith(isObscure: !state.isObscure));
  }

  void _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
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
