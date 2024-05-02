import 'package:auth/pages/chat_page/view/page/chat_poage.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/auth/change password/view/page/change_password_page.dart';
import 'features/auth/forget password/view/page/forget_password_page.dart';
import 'features/auth/login/view/page/login_page.dart';
import 'features/auth/registeration/view/page/registeration_page.dart';
import 'features/auth/verification/view/page/verification_page.dart';
import 'features/auth/welcome/view/page/welcome_page.dart';
import 'features/auth/onboarding/view/components/onboarding_widget.dart';
import 'features/dashboard/view/page/dashboard_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final onboarding = prefs.getBool("onboarding") ?? false;
  MaterialApp materialApp = const MaterialApp(
    builder: DevicePreview.appBuilder,
    useInheritedMediaQuery: true,
    debugShowCheckedModeBanner: false,
    home: OnboardingView(),
  );
  runApp(
    DevicePreview(enabled: true, builder: (context) => materialApp),
    // MyApp(onboarding: onboarding)
  );
}

class MyApp extends StatelessWidget {
  final bool onboarding;
  const MyApp({super.key, this.onboarding = false});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/onboarding": (context) => const OnboardingView(),
        "/": (context) => const WelcomePage(),
        "/login": (context) => const LoginPage(),
        "/signup": (context) => const RegisterationPage(),
        "/forget": (context) => const ForgetPasswordPage(),
        "/change": (context) => const ChangePasswordPage(),
        "/verification": (context) => const VerificationPage(),
        "/dashboard": (context) => const DashboardPage(),
      },
      initialRoute: onboarding ? "/onboarding" : "/",
    );
  }
}
