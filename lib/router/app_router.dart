import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:musicbox/views/login/login.dart';
import 'package:musicbox/views/home/navbar_home.dart';

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
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeCenter();
        },
      ),
    ],
  );
}
