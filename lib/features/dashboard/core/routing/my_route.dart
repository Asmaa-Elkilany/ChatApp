
import 'package:dashboard/modules/new_chat/view/page/new_chat_page.dart';
import 'package:dashboard/pages/chat_page/view/page/chat_page.dart';
import 'package:flutter/material.dart';

import '../../view/page/dashboard_page.dart';

class MyRoute {
  static List<Route<dynamic>> initialRoutes = [
    MaterialPageRoute(builder: (_) => const DashboardPage()),
  ];

  static Route<dynamic> onNavigateByName(RouteSettings settings) {
    switch (settings.name) {
      case 'dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case 'new_Chat':
        return MaterialPageRoute(builder: (_) => const NewChatPage());
      case 'chat_in':
      return MaterialPageRoute(builder: (_) => const ChatPage());

      default:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
    }
  }
}
