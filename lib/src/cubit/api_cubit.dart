import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

part '../state/api_state.dart';

class APICubit extends Cubit<APIState> {
  APICubit() : super(APIInitiatedState());

  String base = "https://reqres.in/api";

  void register({required String email, required String password}) {
    emit(APILoginLoadingState());

    post(
      Uri.parse('$base/register'),
      body: <String, String>{
        'email': email,
        'password': password,
      },
    ).then((response) {
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(APILoginSucceedState(id: json["id"], token: json["token"]));
      } else {
        emit(APILoginFailedState(
          messageTitle: "Register Failed",
          messageContent: json["error"],
        ));
      }
    });
  }

  void login({required String email, required String password}) {
    emit(APILoginLoadingState());

    post(
      Uri.parse('$base/login'),
      body: <String, String>{
        'email': email,
        'password': password,
      },
    ).then((response) {
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(APILoginSucceedState(token: json["token"]));
      } else {
        emit(APILoginFailedState(
          messageTitle: "Login Failed",
          messageContent: json["error"],
        ));
      }
    });
  }
}
