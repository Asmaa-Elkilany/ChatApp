import 'package:flutter/material.dart';

import '../components/registeration_widget.dart';

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