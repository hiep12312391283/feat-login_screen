import 'package:bloc/bloc.dart';
import 'package:login_screen/models/user_repository.dart';
import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(LoadedState(UserRepository.isLoggedIn)) {
    on<LogoutEvent>((event, emit) {
      UserRepository.setLoggedIn(false);
      emit(LoadedState(UserRepository.isLoggedIn));
    });
    on<IsLoggedInEvent>((event, emit) {
      emit(LoadedState(UserRepository.isLoggedIn));
    });
  }
}
