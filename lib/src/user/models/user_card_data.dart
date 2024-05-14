part of '../user.dart';

class UserCardData extends DModel {
  const UserCardData({
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
  UserCardData copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) {
    return UserCardData(
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

  static UserCardData fromJSON(JSON value) {
    return UserCardData(
      id: value.of('id'),
      email: value.of('email'),
      firstName: value.of('first_name'),
      lastName: value.of('last_name'),
      avatar: value.of('avatar'),
    );
  }

  factory UserCardData.test() {
    return UserCardData(
      id: 1,
      email: "jane.doe@reqres.in",
      firstName: "Jane",
      lastName: "Doe",
      avatar: Shared.value.placeholder,
    );
  }
}
