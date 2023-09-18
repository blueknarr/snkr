import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:snkr/presentation/main/main_screen.dart';
import 'package:snkr/presentation/main/main_view_model.dart';
import 'package:snkr/presentation/search/search_screen.dart';

import '../../di/di_setup.dart';
import '../../presentation/discover/discover_screen.dart';
import '../../presentation/main_bottom_navigation_bar.dart';

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          Tween(
            begin: const Offset(1.0, 0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeInOut)),
        ),
        child: child,
      );
    },
  );
}

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/search',
        builder: (context, state) {
          return ChangeNotifierProvider(
            create: (_) => getIt.get<MainViewModel>(),
            child: const SearchScreen(),
          );
        },
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context, state: state, child: const SearchScreen())),
    StatefulShellRoute.indexedStack(
      builder: (context, state, StatefulNavigationShell navigationShell) {
        return ChangeNotifierProvider(
            create: (_) => getIt.get<MainViewModel>(),
            child: MainBottomNavigationBar(navigationShell: navigationShell));
      },
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/',
            builder: (context, state) {
              return ChangeNotifierProvider(
                create: (_) => getIt.get<MainViewModel>(),
                child: const MainScreen(),
              );
            },
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/discover',
            builder: (context, state) {
              return ChangeNotifierProvider(
                create: (_) => getIt.get<MainViewModel>(),
                child: const DiscoverScreen(),
              );
            },
          ),
        ]),
      ],
    ),
  ],
);
