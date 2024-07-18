// app_event.dart
import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class LogoutEvent extends AppEvent {}

class IsLoggedInEvent extends AppEvent{}
