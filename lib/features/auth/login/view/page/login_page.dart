import 'package:flutter/material.dart';
import '../components/login_widget.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LoginWidget(),
      ),
    );
  }
}