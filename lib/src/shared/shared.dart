library shared;

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dart_fusion_flutter/dart_fusion_flutter.dart' hide ContentType;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reqres_test/src/home/home.dart';
import 'package:flutter_reqres_test/src/login/login.dart';
import 'package:go_router/go_router.dart';
import 'package:local_shared/local_shared.dart';

part 'controllers/textarea.dart';
part 'models/extensions.dart';
part 'models/routes.dart';
part 'models/values.dart';
part 'views/background.dart';
part 'views/button.dart';
part 'views/textarea.dart';

final class Shared {
  static Routes route = Routes();
  static const Values value = Values();
  static SharedCollection collection = LocalShared.collection('cache');
}
