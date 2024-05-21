import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/core/utils/context_extension.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/my_button.dart';
import '/../../../core/utils/validation.dart';

class ChangePasswordWidget extends StatefulWidget {
  ChangePasswordWidget({super.key});

  @override
  State<ChangePasswordWidget> createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
  bool showSpinner = false;
  bool showPassword = false;
  bool showConfirmPassword = false;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  String? validatePassword(String? value) {
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 35),
          const Text(
            "Change Password",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: Color(0xff2e386b),
            ),
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            hintText: 'Password',
            suffixIcon: IconButton(
              onPressed: () {
                showPassword = !showPassword;
                setState(() {});
              },
              icon: Icon(showPassword == false
                  ? CupertinoIcons.eye_slash
                  : CupertinoIcons.eye),
              color: const Color(0xff2e386b),
            ),
            obscureText: showPassword,
            controller: passwordController,
            validator: MyValidation().passwordValidation,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            obscureText: showConfirmPassword,
            suffixIcon: IconButton(
              onPressed: () {
                showConfirmPassword = !showConfirmPassword;
                setState(() {});
              },
              icon: Icon(showConfirmPassword == false
                  ? CupertinoIcons.eye_slash
                  : CupertinoIcons.eye),
              color: const Color(0xff2e386b),
            ),
            hintText: 'Confirm Password',
            controller: confirmPasswordController,
            validator: validatePassword,
          ),
          const SizedBox(height: 20),
          MyButton(
            color: Colors.blue[800]!,
            title: "Confirm",
            onPressed: () {
              if (passwordController.text == confirmPasswordController.text) {
                // Passwords match, do something
                Navigator.pushNamed(context, 'verification');
              } else {
                // Passwords don't match, show error message
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Passwords do not match'),
                  backgroundColor: Colors.red,
                ));
              }
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
