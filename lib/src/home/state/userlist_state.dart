part of '../cubit/userlist_cubit.dart';

abstract class UserListState extends Equatable {}

class UserListLoading extends UserListState {
  @override
  List<Object?> get props => [];
}

class UserListSucceed extends UserListState {
  UserListSucceed({required this.model});
  final UserListModel model;
  @override
  List<Object?> get props => [model];
}

class UserListFailed extends UserListState {
  UserListFailed({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
