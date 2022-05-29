import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import 'package:flutter_reqres_test/src/home/model/userlist_model.dart';

part '../state/userlist_state.dart';

class UserListCubit extends Cubit<UserListState> {
  UserListCubit() : super(UserListLoading()) {
    fetching();
  }

  void fetching({int? page}) {
    get(
      Uri.parse('https://reqres.in/api/users?page=${page ?? 1}'),
    ).then((response) {
      try {
        var json = jsonDecode(response.body);
        if (response.statusCode == 200) {
          emit(UserListSucceed(model: UserListModel.fromJson(json)));
        } else {
          emit(UserListFailed(
              message: "${response.statusCode} ${response.reasonPhrase}"));
        }
      } catch (e) {
        emit(UserListFailed(message: e.toString()));
      }
    });
  }
}
