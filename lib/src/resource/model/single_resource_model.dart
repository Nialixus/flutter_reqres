import 'resource_model.dart';
import '../../etc/model/support_model.dart';

/// Parent model of [ResourceModel] which will be used in [ResourcePage].
class SingleResourceModel {
  /// Resource Model to display in [ResourcePage].
  final ResourceModel data;

  /// Support Model fetched from [ResourceCubit.fetching].
  final SupportModel support;

  /// Fetch [ResourceModel] and [SupportModel] from API.
  SingleResourceModel({required this.data, required this.support});

  /// Convert json model from API to [SingleResourceModel].
  factory SingleResourceModel.fromJson(Map<String, dynamic> json) {
    return SingleResourceModel(
        data: ResourceModel.fromJson(json["data"]),
        support: SupportModel.fromJson(json["support"]));
  }
}
