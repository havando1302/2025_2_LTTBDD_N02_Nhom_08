import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:musicbox/views/login/login.dart';

class RouterCustom {
  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: <RouteBase>[
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
    ],
  );
}
