import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitiated());

  register({
    required String email,
    required String username,
    required String password,
  }) async {
    emit(RegisterLoading());

    final Response response = await post(
      Uri.parse('http://94.74.86.174:8080/api/register'),
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'username': username,
      }),
    );

    print(response.body);

    try {
      response.statusCode >= 200 && response.statusCode <= 299
          ? emit(RegisterSucceed())
          : emit(RegisterFailed(message: "Status code ${response.statusCode}"));
    } catch (e) {
      emit(RegisterFailed(message: e.toString()));
    }
  }
}
