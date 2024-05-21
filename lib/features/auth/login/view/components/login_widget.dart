import 'package:flutter/cupertino.dart';
import 'package:project_flutter/core/utils/context_extension.dart';
import 'package:project_flutter/core/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/validation.dart';
import '../../../../../core/widgets/my_button.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showPassword = false;
  bool showConfirmPassword = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                color: Color(0xff2e386b),
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
            CustomTextFormField(
              onChanged: (value) {
                email = value;
              },
              controller: emailController,
              keyboardType: TextInputType.name,
              validator: MyValidation().emailValidation,
              label: const Text("Mail"),
              hintText: "xxxx@gmial.com",
              prefixIcon: const Icon(
                Icons.mail,
                color: Color(0xff2e386b),
              ),
            ),
            const SizedBox(
              height: 20,
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
              height: 20,
            ),
            showSpinner == true
                ? const CircularProgressIndicator()
                : MyButton(
              color: Colors.blue[800]!,
              title: "Login",
              onPressed: () async {
                setState(() {
                  showSpinner = true;
                });
                try {
                  await _auth
                      .signInWithEmailAndPassword(
                      email: email, password: password)
                      .then((value) =>
                      Navigator.pushNamed(context, 'dashboard'));
                } on FirebaseAuthException catch (e) {
                  String message;

                  if (e.code == 'user-not-found') {
                    message = 'No user found for that email.';
                  } else if (e.code == 'wrong-password') {
                    message = 'Wrong password provided.';
                  } else {
                    message = 'An error occurred. Please try again.';
                  }
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(message),
                  ));
                } finally {
                  setState(() {
                    showSpinner = false;
                  });
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'forget');
                  },
                  child: Text(
                    'Forget password?',
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold,
                      fontFamily: "myFont",
                    ),
                  ),
                ),
                const Text(
                  "     OR     ",
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'signup');
                  },
                  child: Text(
                    'Create Account!',
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
