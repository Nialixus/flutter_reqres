part of 'login_cubit.dart';

abstract class LoginState extends Equatable {}

class LoginInitiated extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSucceed extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginFailed extends LoginState {
  LoginFailed({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
