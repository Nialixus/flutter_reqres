import '../../etc/model/support_model.dart';
import '../../resource/model/resource_model.dart';

/// Resource List Model class for fetched model from API.
class ResourceListModel {
  ///```dart
  ///{
  ///   page: 1, ...
  ///}
  ///```
  final int page;

  ///```dart
  ///{
  ///   per_page: 6, ...
  ///}
  ///```
  final int perPage;

  ///```dart
  ///{
  ///   total: 12, ...
  ///}
  ///```
  final int total;

  ///```dart
  ///{
  ///   total_pages: 2, ...
  ///}
  ///```
  final int totalPages;

  ///```dart
  ///{
  ///   data: [ ... ], ...
  ///}
  ///```
  final List<ResourceModel> data;

  ///```dart
  ///{
  ///   support: ... , ...
  ///}
  ///```
  final SupportModel support;

  /// List of [ResourceModel] used in [ResourceListWidget].
  ResourceListModel(
      {required this.page,
      required this.perPage,
      required this.total,
      required this.totalPages,
      required this.data,
      required this.support});

  /// Convert json model to [ResourceListModel].
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
