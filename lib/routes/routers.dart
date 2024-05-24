import 'package:d/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter routers = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: "/",
      builder: (BuildContext context, GoRouterState state) {
        // return const CustomScrollViewExample();
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) {
        return const Home();
      },
      routes: [
        GoRoute(
          path: "search",
          builder: (BuildContext context, GoRouterState state) {
            return const SearchScreen();
          },
        ),
      ],
    ),
    GoRoute(
      path: "/second",
      builder: (BuildContext context, GoRouterState state) {
        return const Second();
      },
    ),
  ],
);
