import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reqres_test/src/etc/extension/datestring.dart';
import 'package:http/http.dart';

import '../model/single_user_model.dart';

part '../state/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({int? id}) : super(UserLoading()) {
    fetching(id: id ?? 1);
  }

  String get base => "https://reqres.in/api/users";

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

  Future<String> deleting(int id) async {
    Response response = await delete(Uri.parse('$base/$id'));
    if (response.statusCode == 204) {
      return "Succesfully deleted";
    } else {
      return "${response.statusCode} Failed to Delete";
    }
  }
}
