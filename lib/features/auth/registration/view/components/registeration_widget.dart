import 'package:project_flutter/core/utils/context_extension.dart';
import 'package:project_flutter/core/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/validation.dart';
import '../../../../../core/widgets/my_button.dart';

class RegisterationWidget extends StatefulWidget {
  const RegisterationWidget({super.key});

  @override
  State<RegisterationWidget> createState() => _RegisterationWidgetState();
}

class _RegisterationWidgetState extends State<RegisterationWidget> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 35,
            ),
            const Text(
              "Signup",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                color: Color(0xff2e386b),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Image.asset(
              "assets/images/logo.png",
              width: context.width / 1.5,
              height: context.height / 3,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              prefixIcon: const Icon(
                Icons.person,
                color: Color(0xff2e386b),
              ),
              hintText: 'User name',
              validator: MyValidation().nameValidation,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              prefixIcon: const Icon(
                Icons.email,
                color: Color(0xff2e386b),
              ),
              hintText: 'pesron@gmail.com',
              onChanged: (value) {
                email = value;
                print(email);
              },
              validator: MyValidation().emailValidation,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              onChanged: (value) {
                password = value;
              },
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
              height: 15,
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
            const SizedBox(
              height: 15,
            ),
            showSpinner == true
                ? const CircularProgressIndicator()
                : MyButton(
              color: Colors.blue[800]!,
              title: "Signup",
              onPressed: () async {
                setState(() {
                  showSpinner = true;
                });
                try {
                  final newUser = await _auth
                      .createUserWithEmailAndPassword(
                      email: email, password: password)
                      .then((value) {
                    Navigator.pushNamed(context, 'login');
                  });
                } on FirebaseAuthException catch (e) {
                  String message;
                  if (e.code == 'weak-password') {
                    message = 'The password provided is too weak.';
                  } else if (e.code == 'email-already-in-use') {
                    message = 'This email is already in use';
                  } else {
                    message = 'An error occurred. Please try again.';
                  }
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(message),
                      );
                    },
                  );
                }
                setState(() {
                  showSpinner = false;
                });
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account? '),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold,
                      fontFamily: "myFont",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
