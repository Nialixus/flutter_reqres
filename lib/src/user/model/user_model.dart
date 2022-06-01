/// User Model from API.
///
/// ```dart
/// {
///     "id": 2,
///     "email": "janet.weaver@reqres.in",
///     "first_name": "Janet",
///     "last_name": "Weaver",
///     "avatar": "https://reqres.in/img/faces/2-image.jpg"
/// }
/// ```
class UserModel {
  /// ```dart
  /// {
  ///   "id": 2, ...
  /// }
  /// ```
  final int id;

  ///```dart
  ///{
  ///   "email": "janet.weaver@reqres.in", ...
  ///}
  ///```
  final String email;

  ///```dart
  ///{
  ///   "first_name": "Janet", ...
  ///}
  ///```
  final String firstName;

  ///```dart
  ///{
  ///   "last_name": "Weaver", ...
  ///}
  ///```
  final String lastName;

  ///```dart
  ///{
  ///   "avatar": "https://reqres.in/img/faces/2-image.jpg", ...
  ///}
  ///```
  final String avatar;

  /// Decode Model from API to dart class.
  UserModel(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar});

  /// Convert model from API to dart class.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["id"] as int,
        email: json["email"] as String,
        firstName: json["first_name"] as String,
        lastName: json["last_name"] as String,
        avatar: json["avatar"] as String);
  }

  @override
  String toString() {
    return "UserModel(id: $id, email: $email, first_name: $firstName, lastName: $lastName, avatar: $avatar)";
  }
}
