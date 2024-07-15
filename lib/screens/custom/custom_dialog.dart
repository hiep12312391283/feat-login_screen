import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen/bloc/login/login_bloc.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.error ?? 'Thông tin đăng nhập không hợp lệ'),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'))
              ],
            ),
          );
        },
      ),
    );
  }
}
