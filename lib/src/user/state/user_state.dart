part of '../cubit/user_cubit.dart';

abstract class UserState extends Equatable {}

class UserLoading extends UserState {
  @override
  List<Object?> get props => [];
}

class UserSucceed extends UserState {
  UserSucceed({required this.model});
  final SingleUserModel model;
  @override
  List<Object?> get props => [model];
}

class UserFailed extends UserState {
  UserFailed({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
