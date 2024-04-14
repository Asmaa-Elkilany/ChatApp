import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/auth/change password/view/components/change_password.dart';
import 'features/auth/forget password/view/components/forget_password_page.dart';
import 'features/auth/login/view/components/login_page.dart';
import 'features/auth/registeration/view/components/registeration_page.dart';
import 'features/auth/verivication/view/components/verification_page.dart';
import 'features/auth/welcome/view/components/welcome_page.dart';
import 'features/auth/onboarding/view/components/onboarding_view.dart';

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
          "/login": (context) =>  LoginPage(),
          "/signup": (context) => const RegisterationPage(),
          "/forget": (context) => const ForgetPasswordPage(),
          "/change": (context) => ChangePasswordPage(),
          "/verification": (context) => const VerificationPage(),
        },
      initialRoute: onboarding ? "/onboarding" : "/",
      );
  }
}


