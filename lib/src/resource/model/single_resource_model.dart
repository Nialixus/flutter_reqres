import 'package:flutter_reqres_test/src/home/model/resourcelist_model.dart';

import '../../etc/model/support_model.dart';

class SingleResourceModel {
  final ResourceModel data;
  final SupportModel support;
  SingleResourceModel({required this.data, required this.support});

  factory SingleResourceModel.fromJson(Map<String, dynamic> json) {
    return SingleResourceModel(
        data: ResourceModel.fromJson(json["data"]),
        support: SupportModel.fromJson(json["support"]));
  }
}
