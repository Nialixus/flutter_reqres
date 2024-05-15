part of '../user.dart';

class UserData extends DModel {
  const UserData({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  String get fullName {
    return "$firstName $lastName";
  }

  @override
  UserData copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) {
    return UserData(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  JSON get toJSON {
    return {
      "id": id,
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "avatar": avatar,
    };
  }

  static UserData fromJSON(JSON value) {
    return UserData(
      id: value.of('id'),
      email: value.of('email'),
      firstName: value.of('first_name'),
      lastName: value.of('last_name'),
      avatar: value.of('avatar'),
    );
  }

  factory UserData.test() {
    return UserData(
      id: 1,
      email: "jane.doe@reqres.in",
      firstName: "Jane",
      lastName: "Doe",
      avatar: Shared.value.placeholder,
    );
  }
}
