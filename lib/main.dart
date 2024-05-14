import 'package:flutter/material.dart';
import 'package:flutter_reqres_test/src/shared/shared.dart';
import 'package:go_router/go_router.dart';
import 'package:local_shared/local_shared.dart' hide Shared;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalShared('database').initialize();
  runApp(
    MaterialApp.router(
      title: 'Flutter Reqres Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          surface: Colors.white,
          onSurface: Colors.black,
          primary: Color(0xff31428B),
          secondary: Color(0xff583A75),
        ),
      ),
      routerConfig: GoRouter(
        initialLocation: Shared.route.home.path,
        routes: [Shared.route.login, Shared.route.home],
      ),
    ),
  );
}
