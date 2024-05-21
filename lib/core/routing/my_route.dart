
import 'package:project_flutter/features/auth/change%20password/view/page/change_password_page.dart';
import 'package:project_flutter/features/auth/forget%20password/view/page/forget_password_page.dart';
import 'package:project_flutter/features/auth/onboarding/view/components/onboarding_widget.dart';
import 'package:project_flutter/features/auth/registration/view/page/registeration_page.dart';
import 'package:project_flutter/features/auth/verification/view/page/verification_page.dart';
import 'package:flutter/material.dart';

import '../../features/auth/login/view/page/login_page.dart';
import '../../features/auth/welcome/view/page/welcome_page.dart';
import '../../features/dashboard/modules/new_chat/view/page/new_chat_page.dart';
import '../../features/dashboard/pages/chat_page/view/page/chat_page.dart';
import '../../features/dashboard/view/page/dashboard_page.dart';


class MyRoute {
  static List<Route<dynamic>> initialRoutes = [
    MaterialPageRoute(builder: (_) => const OnboardingView()),
  ];

  static Route<dynamic> onNavigateByName(RouteSettings settings) {
    switch (settings.name) {
      case 'onboarding':
        return MaterialPageRoute(builder: (_) => const OnboardingView());

      case 'dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case 'new_chat':
        return MaterialPageRoute(builder: (_) => const NewChatPage());
      case 'new_Chat':
        return MaterialPageRoute(builder: (_) => const NewChatPage());
      case 'chat_in':
        return MaterialPageRoute(builder: (_) => const ChatPage());
      case 'welcome':
        return MaterialPageRoute(builder: (_) => const WelcomePage());
      case 'login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case 'signup':
        return MaterialPageRoute(builder: (_) => const RegisterationPage());
      case 'forget':
        return MaterialPageRoute(builder: (_) => const ForgetPasswordPage());
      case 'change':
        return MaterialPageRoute(builder: (_) => const ChangePasswordPage());
      case 'verification':
        return MaterialPageRoute(builder: (_) => const VerificationPage());
      default:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
    }
  }
}
