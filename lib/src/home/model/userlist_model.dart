import 'dart:convert';

import 'package:flutter_reqres_test/src/etc/model/support_model.dart';
import 'package:flutter_reqres_test/src/home/model/user_model.dart';

class UserListModel {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<UserModel> data;
  final SupportModel support;

  UserListModel(
      {required this.page,
      required this.perPage,
      required this.total,
      required this.totalPages,
      required this.data,
      required this.support});

  factory UserListModel.fromJson(Map<String, dynamic> json) {
    return UserListModel(
        page: json["page"] as int,
        perPage: json["per_page"] as int,
        total: json["total"] as int,
        totalPages: json["total_pages"] as int,
        data: (json["data"] as List)
            .map((value) => UserModel.fromJson(value))
            .toList(),
        support: SupportModel.fromJson(json["support"]));
  }

  @override
  String toString() {
    return "UserListModel(page: $page, per_page: $perPage, total: $total, total_pages: $totalPages, data: $data, support: $support)";
  }
}
