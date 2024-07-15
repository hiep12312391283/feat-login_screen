import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // import AppBloc
import 'package:login_screen/bloc/app/app_bloc.dart';
import 'package:login_screen/bloc/app/app_state.dart';
import 'package:login_screen/screens/home_page.dart';
import 'package:login_screen/screens/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state is LoggedInState) {
          return const HomePage();
        } else if (state is LoggedOutState) {
          return const LoginPage();
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
