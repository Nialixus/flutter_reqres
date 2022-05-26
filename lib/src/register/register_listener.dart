import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_api/src/checklist/checklist_widget.dart';
import 'package:product_api/src/register/register_cubit.dart';

class RegisterListener extends StatelessWidget {
  const RegisterListener({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (listen) => const Center(
                  child: CircularProgressIndicator(strokeWidth: 7.5)));
        } else if (state is RegisterFailed) {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (listen) => AlertDialog(
                  title: const Text("Register Failed"),
                  content: Text(state.message)));
        } else if (state is RegisterSucceed) {
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