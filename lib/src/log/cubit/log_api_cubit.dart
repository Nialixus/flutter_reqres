import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

part '../state/log_api_state.dart';

/// State used in [LogPage].
class LogAPICubit extends Cubit<LogAPIState> {
  /// Initiate [LogAPIState].
  LogAPICubit() : super(LogAPIInitiated());

  /// Default base of API.
  String base = "https://reqres.in/api";

  /// Method when register button onClick.
  void register({required String email, required String password}) {
    emit(LogAPILoading());

    post(
      Uri.parse('$base/register'),
      body: <String, String>{
        'email': email,
        'password': password,
      },
    ).then((response) {
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(LogAPISucceed(id: json["id"], token: json["token"]));
      } else {
        emit(LogAPIFailed(
          messageTitle: "Register Failed",
          messageContent: json["error"],
        ));
      }
    });
  }

  /// Method when login button onClick.
  void login({required String email, required String password}) {
    emit(LogAPILoading());

    post(
      Uri.parse('$base/login'),
      body: <String, String>{
        'email': email,
        'password': password,
      },
    ).then((response) {
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(LogAPISucceed(token: json["token"]));
      } else {
        emit(LogAPIFailed(
          messageTitle: "Login Failed",
          messageContent: json["error"],
        ));
      }
    });
  }
}
