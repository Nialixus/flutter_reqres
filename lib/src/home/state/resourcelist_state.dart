part of '../cubit/resourcelist_cubit.dart';

abstract class ResourceListState extends Equatable {}

class ResourceListLoading extends ResourceListState {
  @override
  List<Object?> get props => [];
}

class ResourceListSucceed extends ResourceListState {
  ResourceListSucceed({required this.model});
  final ResourceListModel model;
  @override
  List<Object?> get props => [model];
}

class ResourceListFailed extends ResourceListState {
  ResourceListFailed({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
