
import 'package:flutter/material.dart';
import '../components/welcome_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: WelcomeWidget(),
      ),
    );
  }
}