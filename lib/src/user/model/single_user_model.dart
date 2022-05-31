import 'package:flutter_reqres_test/src/etc/model/support_model.dart';

import 'user_model.dart';

class SingleUserModel {
  final UserModel data;
  final SupportModel support;

  SingleUserModel({required this.data, required this.support});

  factory SingleUserModel.fromJson(Map<String, dynamic> json) {
    return SingleUserModel(
        data: UserModel.fromJson(json["data"]),
        support: SupportModel.fromJson(json["support"]));
  }
}
