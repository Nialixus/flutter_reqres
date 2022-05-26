import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitiated());

  login({
    required String username,
    required String password,
  }) async {
    emit(LoginLoading());

    final Response response = await post(
      Uri.parse('http://94.74.86.174:8080/api/login'),
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    try {
      response.statusCode >= 200 && response.statusCode <= 299
          ? emit(LoginSucceed())
          : emit(LoginFailed(message: "Status code ${response.statusCode}"));
    } catch (e) {
      emit(LoginFailed(message: e.toString()));
    }
  }
}
