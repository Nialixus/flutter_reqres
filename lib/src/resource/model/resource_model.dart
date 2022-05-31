part of '../../home/model/resourcelist_model.dart';

class ResourceModel {
  final int id;
  final int year;
  final String name;
  final Color color;
  final String pantoneValue;

  ResourceModel(
      {required this.id,
      required this.year,
      required this.name,
      required this.color,
      required this.pantoneValue});

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
