library user;

import 'package:api_bloc/api_bloc.dart';
import 'package:dart_fusion_flutter/dart_fusion_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reqres_test/src/login/login.dart';
import 'package:flutter_reqres_test/src/shared/shared.dart';
import 'package:go_router/go_router.dart';
import 'package:local_shared/local_shared.dart' hide Shared, JSON;
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';

part 'controllers/user_request.dart';
part 'models/user_data.dart';
part 'views/user_card.dart';
part 'views/user_header.dart';
part 'views/user_page.dart';
