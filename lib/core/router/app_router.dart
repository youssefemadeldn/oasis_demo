import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/auth/presentation/pages/onboarding_screen.dart';
import '../../features/auth/presentation/pages/splash_screen.dart';
import '../../features/claims/presentation/pages/claim_detail_screen.dart';
import '../../features/claims/presentation/pages/claims_screen.dart';
import '../../features/claims/presentation/pages/submit_claim_screen/submit_claim_screen.dart';
import '../../features/home/presentation/pages/home_screen/home_screen.dart';
import '../../features/notifications/presentation/pages/notifications_screen.dart';
import '../../features/policies/presentation/pages/policies_screen.dart';
import '../../features/policies/presentation/pages/policy_detail_screen.dart';
import '../../features/profile/presentation/pages/profile_screen.dart';
import '../../features/support/presentation/pages/support_screen.dart';
import 'app_routes.dart';
import 'args/claim_detail_args.dart';
import 'args/claims_args.dart';
import 'args/policy_detail_args.dart';
import 'args/submit_claim_args.dart';

/// Builds the app's [GoRouter] instance.
///
/// UI-only pass: no `BlocProvider` wrapping (no cubits exist yet) — routes
/// call each screen constructor directly. Screens requiring args cast
/// `state.extra` with a null guard → [_unknown]; screens with optional args
/// default to an empty instance instead, since a null `extra` is valid there.
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
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: '/onboarding',
          name: AppRoutes.onboarding,
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: '/login',
          name: AppRoutes.login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/home',
          name: AppRoutes.home,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/notifications',
          name: AppRoutes.notifications,
          builder: (context, state) => const NotificationsScreen(),
        ),
        GoRoute(
          path: '/policies',
          name: AppRoutes.policies,
          builder: (context, state) => const PoliciesScreen(),
        ),
        GoRoute(
          path: '/policy-detail',
          name: AppRoutes.policyDetail,
          builder: (context, state) {
            final args = state.extra as PolicyDetailArgs?;
            if (args == null) return _unknown(state);
            return PolicyDetailScreen(args: args);
          },
        ),
        GoRoute(
          path: '/claims',
          name: AppRoutes.claims,
          builder: (context, state) {
            final args = state.extra as ClaimsArgs? ?? const ClaimsArgs();
            return ClaimsScreen(args: args);
          },
        ),
        GoRoute(
          path: '/claim-detail',
          name: AppRoutes.claimDetail,
          builder: (context, state) {
            final args = state.extra as ClaimDetailArgs?;
            if (args == null) return _unknown(state);
            return ClaimDetailScreen(args: args);
          },
        ),
        GoRoute(
          path: '/submit-claim',
          name: AppRoutes.submitClaim,
          builder: (context, state) {
            final args =
                state.extra as SubmitClaimArgs? ?? const SubmitClaimArgs();
            return SubmitClaimScreen(args: args);
          },
        ),
        GoRoute(
          path: '/profile',
          name: AppRoutes.profile,
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: '/support',
          name: AppRoutes.support,
          builder: (context, state) => const SupportScreen(),
        ),
      ],
      errorBuilder: (context, state) => _unknown(state),
    );
  }

  static Widget _unknown(GoRouterState state) => const UnknownScreen();
}

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(child: Text('Unknown route')),
      ),
    );
  }
}
