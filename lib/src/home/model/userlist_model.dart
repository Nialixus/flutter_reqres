import '../../user/model/user_model.dart';
import '../../etc/model/support_model.dart';

/// Model used in [UserLIstWidget].
class UserListModel {
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
  final List<UserModel> data;

  ///```dart
  ///{
  ///   support: ... , ...
  ///}
  ///```
  final SupportModel support;

  /// List of [UserModel] used in [UserListWidget].
  UserListModel(
      {required this.page,
      required this.perPage,
      required this.total,
      required this.totalPages,
      required this.data,
      required this.support});

  /// Convert model from json API to dart class.
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
