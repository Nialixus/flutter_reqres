import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_api/src/checklist/checklist_widget.dart';
import 'package:product_api/src/login/login_cubit.dart';

class LoginListener extends StatelessWidget {
  const LoginListener({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (listen) => const Center(
                  child: CircularProgressIndicator(strokeWidth: 7.5)));
        } else if (state is LoginFailed) {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (listen) => AlertDialog(
                  title: const Text("Login Failed"),
                  content: Text(state.message)));
        } else if (state is LoginSucceed) {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (listen) => const ChecklistPage()),
          );
        } else {
          // do nothing
        }
      },
      child: child,
    );
  }
}
