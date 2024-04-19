
import 'package:flutter/material.dart';
import '../components/change_widget.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ChangePasswordWidget(),
      ),
    );
  }
}