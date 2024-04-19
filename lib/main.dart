import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/auth/change password/view/page/change_password_page.dart';
import 'features/auth/forget password/view/page/forget_password_page.dart';
import 'features/auth/login/view/page/login_page.dart';
import 'features/auth/registeration/view/page/registeration_page.dart';
import 'features/auth/verification/view/page/verification_page.dart';
import 'features/auth/welcome/view/page/welcome_page.dart';
import 'features/auth/onboarding/view/components/onboarding_widget.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final onboarding = prefs.getBool("onboarding")??false;
  MaterialApp materialApp=  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingView());
  runApp( MyApp(onboarding: onboarding));
}

class MyApp extends StatelessWidget {
  final bool onboarding;
  const MyApp({super.key, this.onboarding = false});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        routes:{
          "/onboarding": (context) => const OnboardingView(),
          "/": (context) => const WelcomePage(),
          "/login": (context) =>  const LoginPage(),
          "/signup": (context) => const RegisterationPage(),
          "/forget": (context) => const ForgetPasswordPage(),
          "/change": (context) =>  const ChangePasswordPage(),
          "/verification": (context) =>  const VerificationPage(),
        },
      initialRoute: onboarding ? "/onboarding" : "/",
      );
  }
}


