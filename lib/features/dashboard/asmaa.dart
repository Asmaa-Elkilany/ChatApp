 import 'package:auth/features/dashboard/view/page/dashboard_page.dart';

import '../auth/change password/view/page/change_password_page.dart';
import '../auth/forget password/view/page/forget_password_page.dart';
import '../auth/login/view/page/login_page.dart';
import '../auth/onboarding/view/components/onboarding_widget.dart';
import '../auth/registeration/view/page/registeration_page.dart';
import '../auth/verification/view/page/verification_page.dart';
import '../auth/welcome/view/page/welcome_page.dart';

class MyRoute{

 static Map route= {
  "/onboarding":  const OnboardingView(),
  "/":  const WelcomePage(),
  "/login":  const LoginPage(),
  "/signup":  const RegisterationPage(),
  "/forget":  const ForgetPasswordPage(),
  "/change": const ChangePasswordPage(),
  "/verification": const VerificationPage(),
  "/dashboard": const DashboardPage(),
  };

 }