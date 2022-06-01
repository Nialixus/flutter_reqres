part of '../cubit/user_cubit.dart';

/// Mother State of User.
abstract class UserState extends Equatable {}

/// State wbere [UserCubit.fetching] is ongoing.
class UserLoading extends UserState {
  @override
  List<Object?> get props => [];
}

/// State where [UserCubit.fetching] end sucessfully.
class UserSucceed extends UserState {
  /// Fetch model from successfully fetching.
  UserSucceed({required this.model});

  /// Model from API.
  final SingleUserModel model;

  @override
  List<Object?> get props => [model];
}

/// State where [UserCubit.fetching] end up failed.
class UserFailed extends UserState {
  /// Fetch error message from failed fetching.
  UserFailed({required this.message});

  /// Error message.
  final String message;

  @override
  List<Object?> get props => [message];
}
