import 'dart:convert';

import 'package:http/http.dart';
import '../cubit/api_cubit.dart';
export 'api_method.dart' hide APIMethod;

class APIMethod extends APICubit {
  @override
  void login({
    required String email,
    required String password,
  }) async {
    emit(APILoading());

    final Response response = await post(
      Uri.parse('$base/api/login'),
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    print(response.body);

    try {
      response.statusCode >= 200 && response.statusCode <= 299
          ? emit(APISucceed())
          : emit(APIFailed(
              messageTitle: "Login Failed",
              messageContent: "Status code ${response.statusCode}"));
    } catch (e) {
      emit(APIFailed(
          messageTitle: "Login Failed", messageContent: e.toString()));
    }
  }
}
