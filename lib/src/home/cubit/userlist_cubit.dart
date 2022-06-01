import 'dart:convert';
import 'package:http/http.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/model/userlist_model.dart';

part '../state/userlist_state.dart';

/// State used in [UserListWidget].
class UserListCubit extends Cubit<UserListState> {
  /// Initiatin [UserListState].
  UserListCubit() : super(UserListLoading()) {
    fetching();
  }

  /// Fetching [UserListModel] from API.
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
