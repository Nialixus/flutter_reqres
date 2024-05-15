part of '../home.dart';

class HomeData extends DModel {
  const HomeData({required this.users});
  final List<UserData> users;

  @override
  HomeData copyWith({List<UserData>? users}) {
    return HomeData(users: users ?? this.users);
  }

  @override
  JSON get toJSON {
    return {"data": users.toJSON};
  }

  static HomeData fromJSON(JSON value) {
    return HomeData(
        users: value
            .of<List>('data')
            .map<UserData>((e) => UserData.fromJSON(e))
            .toList());
  }
}
