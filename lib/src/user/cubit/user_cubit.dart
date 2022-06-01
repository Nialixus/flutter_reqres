import 'dart:convert';
import 'package:http/http.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/user_page.dart';
import '../model/single_user_model.dart';
import '../../etc/extension/datestring.dart';

part '../state/user_state.dart';

/// State used in [UserPage].
class UserCubit extends Cubit<UserState> {
  /// Initiating [UserState] through [Cubit].
  UserCubit({int? id}) : super(UserLoading()) {
    fetching(id: id ?? 1);
  }

  /// API Base.
  String get base => "https://reqres.in/api/users";

  /// Fetching model from API with Method GET,Response 200 and Request none
  void fetching({required int id}) {
    get(
      Uri.parse('$base/$id'),
    ).then((response) {
      try {
        var json = jsonDecode(response.body);
        if (response.statusCode == 200) {
          emit(UserSucceed(model: SingleUserModel.fromJson(json)));
        } else {
          emit(UserFailed(
              message: "${response.statusCode} ${response.reasonPhrase}"));
        }
      } catch (e) {
        emit(UserFailed(message: e.toString()));
      }
    });
  }

  /// Creating User with Method POST, Response 201 and Request
  /// ```dart
  /// {
  ///  "name": "morpheus",
  ///  "job": "leader",
  ///}
  ///```
  Future<String> creating({required String name, required String job}) async {
    Response response =
        await post(Uri.parse(base), body: {"name": name, "job": job});

    try {
      var json = jsonDecode(response.body);
      DateTime time = DateTime.parse(json["createdAt"]);
      return "ID ${json["id"]} Created at ${time.asString()}";
    } catch (e) {
      return e.toString();
    }
  }

  /// Updating User with Method PUT, response 200, and Request
  /// ```dart
  /// {
  ///   "name": "morpheus",
  ///   "job": "zion resident"
  /// }
  /// ```
  Future<String> updating(int id,
      {required String name, required String job}) async {
    Response response =
        await put(Uri.parse('$base/$id'), body: {"name": name, "job": job});
    try {
      DateTime time = DateTime.parse(jsonDecode(response.body)["updatedAt"]);
      return "Updated at ${time.asString()}";
    } catch (e) {
      return e.toString();
    }
  }

  /// Deleting User with Method DELETE, response 204 and Request None.
  Future<String> deleting(int id) async {
    Response response = await delete(Uri.parse('$base/$id'));
    if (response.statusCode == 204) {
      return "Succesfully deleted";
    } else {
      return "${response.statusCode} Failed to Delete";
    }
  }
}
