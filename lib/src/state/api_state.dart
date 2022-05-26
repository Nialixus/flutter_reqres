part of '../cubit/api_cubit.dart';

abstract class APIState extends Equatable {}

class APIInitiated extends APIState {
  @override
  List<Object> get props => [];
}

class APILoading extends APIState {
  @override
  List<Object?> get props => [];
}

class APISucceed extends APIState {
  @override
  List<Object?> get props => [];
}

class APIFailed extends APIState {
  APIFailed({required this.messageTitle, required this.messageContent});
  final String messageTitle;
  final String messageContent;

  @override
  List<Object?> get props => [messageTitle, messageContent];
}
