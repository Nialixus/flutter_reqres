part of '../shared.dart';

final class Routes {
  final GoRoute login = GoRoute(
    path: '/login',
    builder: (_, __) => BlocProvider(
      create: (_) => LoginRequest(),
      child: const SelectionArea(
        child: SafeArea(
          child: LoginPage(),
        ),
      ),
    ),
  );

  late final GoRoute home = GoRoute(
    path: '/',
    routes: [user],
    builder: (_, __) => BlocProvider(
      create: (_) => HomeRequest(),
      child: const SelectionArea(
        child: SafeArea(
          child: HomePage(),
        ),
      ),
    ),
  );

  final GoRoute user = GoRoute(
    path: 'user/:id',
    builder: (_, state) => BlocProvider(
      create: (_) => UserRequest(id: state.pathParameters.of('id')),
      child: const SelectionArea(
        child: SafeArea(
          child: UserPage(),
        ),
      ),
    ),
  );
}
