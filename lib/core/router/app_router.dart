import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

/// Builds the app's [GoRouter] instance.
///
/// Foundation phase: no feature screens exist yet, so every route below
/// renders [_PlaceholderScreen] as a stand-in. Each entry will be swapped
/// for its real screen — wrapped in `BlocProvider(create: (_) => getIt.call())`
/// (typed to the feature's cubit) — as that feature is built, following the
/// "Routing pattern" section in CLAUDE.md. No `register` route yet — the
/// design kit has no sign-up screen.
class AppRouter {
  const AppRouter._();

  static GoRouter router(GlobalKey<NavigatorState> navigatorKey) {
    return GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          name: AppRoutes.splash,
          builder: (context, state) =>
              const _PlaceholderScreen(title: 'Splash'),
        ),
        GoRoute(
          path: '/login',
          name: AppRoutes.login,
          builder: (context, state) =>
              const _PlaceholderScreen(title: 'Login'),
        ),
        GoRoute(
          path: '/home',
          name: AppRoutes.home,
          builder: (context, state) => const _PlaceholderScreen(title: 'Home'),
        ),
      ],
      errorBuilder: (context, state) => _unknown(state),
    );
  }

  static Widget _unknown(GoRouterState state) =>
      const _PlaceholderScreen(title: 'Unknown route');
}

class _PlaceholderScreen extends StatelessWidget {
  final String title;

  const _PlaceholderScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text(title)),
      ),
    );
  }
}
