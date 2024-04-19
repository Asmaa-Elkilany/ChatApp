import 'package:flutter/material.dart';
import '../components/forget_password_widget.dart';
class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ForgetPasswordWidget(),
      ),
    );
  }
}