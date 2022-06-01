import 'package:flutter/material.dart';

import '../../etc/extension/colorstring.dart';

/// Resource Model used in [ResourcePage].
///
/// ```dart
/// {
///    "id": 2,
///    "name": "fuchsia rose",
///    "year": 2001,
///    "color": "#C74375",
///    "pantone_value": "17-2031"
/// }
/// ```
class ResourceModel {
  /// ```dart
  /// {
  ///     "id": 2, ...
  /// }
  /// ```
  final int id;

  /// ```dart
  /// {
  ///     "year": 2022, ...
  /// }
  /// ```
  final int year;

  /// ```dart
  /// {
  ///     "name": "Fuchsia Rose", ...
  /// }
  /// ```
  final String name;

  /// ```dart
  /// {
  ///     "color": "#CF432A", ...
  /// }
  /// ```
  final Color color;

  /// ```dart
  /// {
  ///     "pantone_value": "17-2031", ...
  /// }
  /// ```
  final String pantoneValue;

  /// Model used in [ResourcePage] and [HomePage].
  ResourceModel(
      {required this.id,
      required this.year,
      required this.name,
      required this.color,
      required this.pantoneValue});

  /// Convert json model from API to dart class.
  factory ResourceModel.fromJson(Map<String, dynamic> json) {
    return ResourceModel(
        id: json["id"] as int,
        name: json["name"] as String,
        year: json["year"] as int,
        color:
            Color(int.parse((json["color"] as String).replaceAll("#", "0xff"))),
        pantoneValue: json["pantone_value"] as String);
  }

  @override
  String toString() {
    return "ResourceModel(id: $id, name: $name, year: $year, color: ${color.asString()}, pantone_value: $pantoneValue)";
  }
}
