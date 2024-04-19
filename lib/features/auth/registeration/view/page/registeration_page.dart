import 'package:auth/features/auth/registeration/view/components/registeration_widget.dart';
import 'package:flutter/material.dart';

class RegisterationPage extends StatelessWidget {
  const RegisterationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: RegisterationWidget(),
      ),
    );
  }
}