import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_api/src/login/login_cubit.dart';
import 'package:product_api/src/login/login_widget.dart';

void main() {
  runApp(MaterialApp(
      title: "Reqres API Sample",
      home:
          BlocProvider(create: (_) => LoginCubit(), child: const LoginPage())));
}
