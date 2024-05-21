import 'package:project_flutter/core/utils/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/my_button.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: Text(
              "ChitChat",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                color: Color(0xff2e386b),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/images/logo.png",
            width: context.width / 1.5,
          ),
          const SizedBox(
            height: 20,
          ),
          MyButton(
            color: Colors.yellow[900]!,
            title: "Login",
            onPressed: () {
              Navigator.pushNamed(context, 'login');
            },
          ),
          const SizedBox(
            height: 20,
          ),
          MyButton(
            color: Colors.blue[800]!,
            title: "Signup",
            onPressed: () {
              Navigator.pushNamed(context, 'signup');
            },
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
