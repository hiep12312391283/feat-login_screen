import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_event.dart';
import 'app_state.dart';
import 'package:login_screen/models/user_repository.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(InitialState()) {
    on<CheckLoginStatus>(_onCheckLoginStatus);
    on<LogoutEvent>(_onLogoutEvent);
  }
  void _onCheckLoginStatus(CheckLoginStatus event, Emitter<AppState> emit) {
    if (UserRepository.isLoggedIn) {
      emit(LoggedIn());
    } else {
      emit(LoggedOut());
    }
  }

  void _onLogoutEvent(LogoutEvent event, Emitter<AppState> emit) {
    UserRepository.setLoggedIn(false);
    emit(LoggedOut());
  }
}
