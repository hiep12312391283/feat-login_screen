// app_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:login_screen/models/user_repository.dart';
import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(UserRepository.isLoggedIn ? LoggedInState() : LoggedOutState()) {
    on<LogoutEvent>((event, emit) {
      UserRepository.setLoggedIn(false);
      emit(LoggedOutState());
    });
  }
}
