import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../method/api_method.dart';

part '../state/api_state.dart';

class APICubit extends Cubit<APIState> {
  APICubit() : super(APIInitiated());

  String base = "https://reqres.in";

  register({
    required String email,
    required String password,
  }) {
    print("tegister");
  }

  void login({required String email, required String password}) =>
      APIMethod().login(email: email, password: password);
}
