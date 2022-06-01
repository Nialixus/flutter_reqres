/// Support Model from API.
class SupportModel {
  ///```dart
  ///{
  ///   url: 'https://reqres.in', ...
  ///}
  ///```
  final String url;

  ///```dart
  ///{
  ///   text: 'Support ReqRes ..', ...
  ///}
  ///```
  final String text;

  /// Support Model from API.
  SupportModel({required this.url, required this.text});

  /// Decode model from json to dart class.
  factory SupportModel.fromJson(Map<String, dynamic> json) {
    return SupportModel(url: json["url"], text: json["text"]);
  }

  @override
  String toString() {
    return "SupportModel(url: $url, text: $text)";
  }
}
