import 'package:demopresent/features/auth/auth_controller.dart';
import 'package:demopresent/features/auth/login_screen.dart';
import 'package:demopresent/features/auth/profile_screen.dart';
import 'package:demopresent/features/go_router_demo/go_router_details_screen.dart';
import 'package:demopresent/features/go_router_demo/go_router_screen.dart';
import 'package:demopresent/features/home/home_screen.dart';
import 'package:demopresent/features/named_route_demo/feedback_model.dart';
import 'package:demopresent/features/named_route_demo/named_details_screen.dart';
import 'package:demopresent/features/named_route_demo/named_route_screen.dart';
import 'package:demopresent/features/navigator_demo/navigator_basic_screen.dart';
import 'package:demopresent/features/result_demo/result_demo_screen.dart';
import 'package:demopresent/features/result_demo/selection_screen.dart';
import 'package:demopresent/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RoutePaths.home,
    refreshListenable: _RiverpodRefreshStream(ref),
    routes: [
      GoRoute(
        name: RouteNames.home,
        path: RoutePaths.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: RouteNames.navigatorBasic,
        path: RoutePaths.navigatorBasic,
        builder: (context, state) => const NavigatorBasicScreen(),
      ),
      GoRoute(
        name: RouteNames.namedRoute,
        path: RoutePaths.namedRoute,
        builder: (context, state) => const NamedRouteScreen(),
      ),
      GoRoute(
        name: RouteNames.namedDetails,
        path: RoutePaths.namedDetails,
        builder: (context, state) {
          final feedback = state.extra as FeedbackModel?;
          return NamedDetailsScreen(feedback: feedback);
        },
      ),
      GoRoute(
        name: RouteNames.goRouterDemo,
        path: RoutePaths.goRouterDemo,
        builder: (context, state) => const GoRouterScreen(),
      ),
      GoRoute(
        name: RouteNames.goRouterDetails,
        path: RoutePaths.goRouterDetails,
        builder: (context, state) {
          final id = state.uri.queryParameters['id'];
          final name = state.uri.queryParameters['name'] ?? 'Unknown';
          final price = state.uri.queryParameters['price'] ?? '0.00';
          final category = state.uri.queryParameters['category'] ?? 'General';
          final source = state.uri.queryParameters['source'] ?? 'direct';
          return GoRouterDetailsScreen(
            id: id,
            name: name,
            price: price,
            category: category,
            source: source,
          );
        },
      ),
      GoRoute(
        name: RouteNames.resultDemo,
        path: RoutePaths.resultDemo,
        builder: (context, state) => const ResultDemoScreen(),
      ),
      GoRoute(
        name: RouteNames.resultSelection,
        path: RoutePaths.resultSelection,
        builder: (context, state) => const SelectionScreen(),
      ),
      GoRoute(
        name: RouteNames.profile,
        path: RoutePaths.profile,
        builder: (context, state) => const ProfileScreen(),
        redirect: (context, state) {
          final authState = ref.read(authProvider);
          if (!authState.isAuthenticated) {
            return RoutePaths.login;
          }
          return null;
        },
      ),
      GoRoute(
        name: RouteNames.login,
        path: RoutePaths.login,
        builder: (context, state) => const LoginScreen(),
        redirect: (context, state) {
          final authState = ref.read(authProvider);
          if (authState.isAuthenticated) {
            return RoutePaths.profile;
          }
          return null;
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('No route defined for ${state.uri}'),
      ),
    ),
  );
});

// Helper class to convert Riverpod state changes to Listenable for GoRouter
class _RiverpodRefreshStream extends ChangeNotifier {
  _RiverpodRefreshStream(Ref ref) {
    ref.listen(authProvider, (previous, next) => notifyListeners());
  }
}
