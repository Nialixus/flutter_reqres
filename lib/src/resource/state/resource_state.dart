part of '../cubit/resource_cubit.dart';

/// State used for [ResourceCubit].
abstract class ResourceState extends Equatable {}

/// State where [ResourceCubit.fetching] is ongoing.
class ResourceLoading extends ResourceState {
  @override
  List<Object?> get props => [];
}

/// State where [ResourceCubit.fetching] end successfully.
class ResourceSucceed extends ResourceState {
  /// Fetch model from API.
  ResourceSucceed({required this.model});

  /// Model to display in [ResourcePage].
  final SingleResourceModel model;
  @override
  List<Object?> get props => [model];
}

/// State where [ResourceCubit.fetching] end up failed.
class ResourceFailed extends ResourceState {
  /// Fetch error message from [ResourceCubit.fetching].
  ResourceFailed({required this.message});

  /// Displayed error message.
  final String message;

  @override
  List<Object?> get props => [message];
}
