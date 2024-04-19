
import 'package:flutter/material.dart';

import '../components/verification_widget.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: VerificationWidget(),
      ),
    );
  }
}