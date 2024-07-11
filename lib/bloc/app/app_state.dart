import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  const AppState();
  @override
  List<Object> get props => [];
}
class LoggedIn extends AppState{}

class LoggedOut extends AppState{}

class InitialState extends AppState {}

