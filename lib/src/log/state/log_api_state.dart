part of '../cubit/log_api_cubit.dart';

abstract class LogAPIState extends Equatable {}

class LogAPIInitiated extends LogAPIState {
  @override
  List<Object> get props => [];
}

class LogAPILoading extends LogAPIState {
  @override
  List<Object?> get props => [];
}

class LogAPISucceed extends LogAPIState {
  LogAPISucceed({this.id, required this.token});
  final String token;
  final String? id;
  @override
  List<Object?> get props => [id, token];
}

class LogAPIFailed extends LogAPIState {
  LogAPIFailed({required this.messageTitle, required this.messageContent});
  final String messageTitle;
  final String messageContent;

  @override
  List<Object?> get props => [messageTitle, messageContent];
}
