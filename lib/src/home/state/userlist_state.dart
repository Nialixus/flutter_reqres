part of '../cubit/userlist_cubit.dart';

/// State used in [UserListWidget].
abstract class UserListState extends Equatable {}

/// State where [UserListCubit.fetching] is ongoing.
class UserListLoading extends UserListState {
  @override
  List<Object?> get props => [];
}

/// State where [UserListCubit.fetching] end successfully.
class UserListSucceed extends UserListState {
  /// Fetching model throught [UserListCubit.fetching].
  UserListSucceed({required this.model});

  /// Model to display in [UserListWidget].
  final UserListModel model;
  @override
  List<Object?> get props => [model];
}

/// State where [UserListCubit.fetching] end up failed.
class UserListFailed extends UserListState {
  /// Fetching error message through [UserListCubit.fetching].
  UserListFailed({required this.message});

  /// Displayed error message.
  final String message;

  @override
  List<Object?> get props => [message];
}
