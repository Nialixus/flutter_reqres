library login;

import 'package:api_bloc/api_bloc.dart';
import 'package:dart_fusion_flutter/dart_fusion_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reqres_test/src/shared/shared.dart';
import 'package:go_router/go_router.dart';
import 'package:local_shared/local_shared.dart' hide Shared, JSON;

part 'controllers/login_request.dart';
part 'models/login_data.dart';
part 'views/login_page.dart';

final class Login {
  static SharedDocument session = Shared.collection.document('token');
}
