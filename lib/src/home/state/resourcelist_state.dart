part of '../cubit/resourcelist_cubit.dart';

/// State used in [ResourceListWidget].
abstract class ResourceListState extends Equatable {}

/// State where [ResourceListCubit.fetching] is ongoing.
class ResourceListLoading extends ResourceListState {
  @override
  List<Object?> get props => [];
}

/// State where [ResourceListCubit.fetching] end successfully.
class ResourceListSucceed extends ResourceListState {
  /// Fetch model through [ResourceListCubit.fetching].
  ResourceListSucceed({required this.model});

  /// Model from API.
  final ResourceListModel model;
  @override
  List<Object?> get props => [model];
}

/// State where [ResourceListCubit.fetching] end successfully.
class ResourceListFailed extends ResourceListState {
  /// Fetch error message from [ResourceListCubit.fetching].
  ResourceListFailed({required this.message});

  /// Displayed error message.
  final String message;

  @override
  List<Object?> get props => [message];
}
