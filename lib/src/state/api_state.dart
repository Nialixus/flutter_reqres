part of '../cubit/api_cubit.dart';

abstract class APIState extends Equatable {}

class APIInitiatedState extends APIState {
  @override
  List<Object> get props => [];
}

class APILoginLoadingState extends APIState {
  @override
  List<Object?> get props => [];
}

class APILoginSucceedState extends APIState {
  APILoginSucceedState({this.id, required this.token});
  final String token;
  final String? id;
  @override
  List<Object?> get props => [id, token];
}

class APILoginFailedState extends APIState {
  APILoginFailedState(
      {required this.messageTitle, required this.messageContent});
  final String messageTitle;
  final String messageContent;

  @override
  List<Object?> get props => [messageTitle, messageContent];
}
