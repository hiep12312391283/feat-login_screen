import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  final bool isLoggedIn;

  const AppState({required this.isLoggedIn});

  @override
  List<Object> get props => [isLoggedIn];
}

class LoadedState extends AppState {
  const LoadedState(bool isLoggedIn) : super(isLoggedIn: false);
}
