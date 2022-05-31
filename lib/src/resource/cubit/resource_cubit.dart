import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../model/single_resource_model.dart';

part '../state/resource_state.dart';

class ResourceCubit extends Cubit<ResourceState> {
  ResourceCubit({required int id}) : super(ResourceLoading()) {
    fetching(id: id);
  }

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
