part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {}

class RegisterInitiated extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterSucceed extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterFailed extends RegisterState {
  RegisterFailed({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
