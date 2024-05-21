import 'package:chaaaaaaaaaaaaaaaaaaaaat/core/utils/context_extension.dart';
import 'package:chaaaaaaaaaaaaaaaaaaaaat/core/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/validation.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: "myFont",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/mob_login.png",
                  width: context.width,
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
                  prefixIcon: const Icon(Icons.mail),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  controller: passwordController,
                  keyboardType: TextInputType.name,
                  hintText: 'xxxxxxxx',
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color(0xff6F35A5),
                  ),
                  suffixIcon:
                      const Icon(Icons.visibility, color: Color(0xff6F35A5)),
                  label: const Text("Password"),
                  validator: MyValidation().passwordValidation,
                ),
                const SizedBox(
                  height: 20,
                ),
                showSpinner == true
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
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
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff6F35A5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 79, vertical: 10),
                        ),
                        child: const Text(
                          "Login",
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'forget');
                      },
                      child: const Text(
                        'Forget password?',
                        style: TextStyle(
                          color: Colors.purple,
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
                      child: const Text(
                        'Create Account!',
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
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              height: 150,
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration decoration = InputDecoration(
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(30)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purple, width: 2),
          borderRadius: BorderRadius.circular(30)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(30)));
}
