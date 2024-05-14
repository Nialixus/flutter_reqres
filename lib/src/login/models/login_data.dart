part of '../login.dart';

class LoginData extends DModel {
  const LoginData({required this.token});
  final String token;

  @override
  LoginData copyWith({String? token}) {
    return LoginData(
      token: token ?? this.token,
    );
  }

  @override
  JSON get toJSON {
    return {
      'token': token,
      ...super.toJSON,
    };
  }

  static LoginData fromJSON(JSON value) {
    return LoginData(
      token: value.of('token'),
    );
  }
}
