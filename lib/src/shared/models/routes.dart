part of '../shared.dart';

final class Routes {
  final GoRoute login = GoRoute(
    path: '/login',
    builder: (_, __) => BlocProvider(
      create: (_) => LoginRequest(),
      child: const SelectionArea(
        child: LoginPage(),
      ),
    ),
  );

  final GoRoute home = GoRoute(
    path: '/',
    builder: (_, __) => BlocProvider(
      create: (_) => HomeRequest(),
      child: const SelectionArea(
        child: HomePage(),
      ),
    ),
  );
}
