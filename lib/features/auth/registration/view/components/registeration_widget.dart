import 'package:chaaaaaaaaaaaaaaaaaaaaat/core/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/validation.dart';

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
              'Signup',
              style: TextStyle(
                fontSize: 35,
                fontFamily: "myFont",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/images/Sign up-cuate.png",
              width: 250,
              height: 250,
            ),
            const SizedBox(
              height: 20,
            ),
            // Icon(
            //   prefixIcon,
            //   color: const Color(0xff6F35A5),
            // ),
            CustomTextFormField(
              prefixIcon: const Icon(Icons.person),
              hintText: 'User name',
              validator: MyValidation().nameValidation,
              keyboardType: TextInputType.name,
            ),

            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              prefixIcon: const Icon(Icons.email),
              hintText: 'pesron@gmail.com',
              onChanged: (value) {
                email = value;
                print(email);
              },
              validator: MyValidation().emailValidation,
              keyboardType: TextInputType.emailAddress,
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
                      : CupertinoIcons.eye)),
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
                      : CupertinoIcons.eye)),
              hintText: 'Confirm Password',
              controller: confirmPasswordController,
              validator: validatePassword,
            ),
            const SizedBox(
              height: 20,
            ),
            showSpinner == true
                ? CircularProgressIndicator()
                : ElevatedButton(
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
                          message = 'الايميل موجود بافعل';
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
                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //   content: Text(message),
                        // ));
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff6F35A5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27),
                      ),
                    ),
                    child: const Text(
                      "Signup",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: "myFont",
                        color: Colors.white,
                      ),
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account? '),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.purple,
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
