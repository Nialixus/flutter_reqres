part of '../cubit/log_api_cubit.dart';

/// State used in [LogAPICubit].
abstract class LogAPIState extends Equatable {}

/// First state when user have not interacted to UI yet.
class LogAPIInitiated extends LogAPIState {
  @override
  List<Object> get props => [];
}

/// State where [LogAPICubit.register] or [LogAPICubit.login] is ongoing.
class LogAPILoading extends LogAPIState {
  @override
  List<Object?> get props => [];
}

/// State where interacting with API end successfully.
class LogAPISucceed extends LogAPIState {
  /// Fetch token from API.
  LogAPISucceed({this.id, required this.token});

  /// Fetched token after successfully enter.
  final String token;

  /// Identification used in [LogAPICubit.register].
  final String? id;
  @override
  List<Object?> get props => [id, token];
}

/// State where interacting with API end up failed.
class LogAPIFailed extends LogAPIState {
  /// Fetch error message from API.
  LogAPIFailed({required this.messageTitle, required this.messageContent});

  /// The title of error.
  final String messageTitle;

  /// The content of error.
  final String messageContent;

  @override
  List<Object?> get props => [messageTitle, messageContent];
}
