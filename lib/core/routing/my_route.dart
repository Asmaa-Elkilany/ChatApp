
import 'package:flutter/material.dart';


class MyRoute {
  static List<Route<dynamic>> initialRoutes = [
    MaterialPageRoute(builder: (_) => const DashboardPage()),
  ];

  static Route<dynamic> onNavigateByName(RouteSettings settings) {
    switch (settings.name) {
      case 'dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case 'new_chat':
     //   return MaterialPageRoute(builder: (_) => const NewChatPage());
      default:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
    }
  }
}
