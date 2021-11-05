import 'package:flutter/material.dart';
import 'package:flutter_trello/pages/dashboard_page.dart';

import 'pages/auth_page.dart';
import 'pages/splash_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/splash_screen': (BuildContext context) => const SplashScreen(),
  '/auth': (BuildContext context) => const AuthPage(),
  '/cards': (BuildContext context) => const DashboardPage(),
};
