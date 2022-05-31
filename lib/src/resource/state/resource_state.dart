part of '../cubit/resource_cubit.dart';

abstract class ResourceState extends Equatable {}

class ResourceLoading extends ResourceState {
  @override
  List<Object?> get props => [];
}

class ResourceSucceed extends ResourceState {
  ResourceSucceed({required this.model});
  final SingleResourceModel model;
  @override
  List<Object?> get props => [model];
}

class ResourceFailed extends ResourceState {
  ResourceFailed({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
