class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserModel(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar});

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
