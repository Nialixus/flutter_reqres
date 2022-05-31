import 'package:flutter/material.dart';
import 'package:flutter_reqres_test/src/etc/extension/capitalize.dart';

import '../../etc/model/support_model.dart';

part '../../resource/model/resource_model.dart';

class ResourceListModel {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<ResourceModel> data;
  final SupportModel support;

  ResourceListModel(
      {required this.page,
      required this.perPage,
      required this.total,
      required this.totalPages,
      required this.data,
      required this.support});

  factory ResourceListModel.fromJson(Map<String, dynamic> json) {
    return ResourceListModel(
        page: json["page"] as int,
        perPage: json["per_page"] as int,
        total: json["total"] as int,
        totalPages: json["total_pages"] as int,
        data: (json["data"] as List)
            .map((value) => ResourceModel.fromJson(value))
            .toList(),
        support: SupportModel.fromJson(json["support"]));
  }

  @override
  String toString() {
    return "ResourceListMode(page: $page, per_page: $perPage, total: $total, total_pages: $totalPages, data: $data, support: $support)";
  }
}
