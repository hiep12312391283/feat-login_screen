// app_state.dart
import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final bool isLoggedIn;

  const AppState({required this.isLoggedIn});

  @override
  List<Object> get props => [isLoggedIn];
}

