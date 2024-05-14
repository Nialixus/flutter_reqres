library home;

import 'package:api_bloc/api_bloc.dart';
import 'package:dart_fusion_flutter/dart_fusion_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reqres_test/src/login/login.dart';
import 'package:flutter_reqres_test/src/shared/shared.dart';
import 'package:flutter_reqres_test/src/user/user.dart';
import 'package:go_router/go_router.dart';
import 'package:local_shared/local_shared.dart' hide Shared, JSON;
import 'package:skeletonizer/skeletonizer.dart';

part 'controllers/home_request.dart';
part 'models/home_data.dart';
part 'views/home_page.dart';
