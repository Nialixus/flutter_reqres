import 'dart:convert';
import 'package:http/http.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/single_resource_model.dart';

part '../state/resource_state.dart';

/// State used in [ResourcePage].
class ResourceCubit extends Cubit<ResourceState> {
  /// Initiating [ResourceState].
  ResourceCubit({required int id}) : super(ResourceLoading()) {
    fetching(id: id);
  }

  /// Fetching resource model from API.
  void fetching({required int id}) {
    get(
      Uri.parse('https://reqres.in/api/unknown/$id'),
    ).then((response) {
      try {
        var json = jsonDecode(response.body);
        if (response.statusCode == 200) {
          emit(ResourceSucceed(model: SingleResourceModel.fromJson(json)));
        } else {
          emit(ResourceFailed(
              message: "${response.statusCode} ${response.reasonPhrase}"));
        }
      } catch (e) {
        emit(ResourceFailed(message: e.toString()));
      }
    });
  }
}
