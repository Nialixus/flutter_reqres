part of '../home.dart';

class HomeData extends DModel {
  const HomeData({required this.users});
  final List<UserCardData> users;

  @override
  HomeData copyWith({List<UserCardData>? users}) {
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
            .map<UserCardData>((e) => UserCardData.fromJSON(e))
            .toList());
  }
}
