import 'package:chaaaaaaaaaaaaaaaaaaaaat/core/utils/context_extension.dart';
import 'package:flutter/material.dart';

import '/../../../core/utils/validation.dart';

class ChangePasswordWidget extends StatelessWidget {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  ChangePasswordWidget({super.key});

  String? _validatePassword(String? value) {
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 35),
                    const Text(
                      'Change password',
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: "myFont",
                      ),
                    ),
                    Image.asset("images/assets/images/Reset password-rafiki.png",
                        width: context.width,
                        height:context.height/2.5
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 10*(context.width)/12,
                      decoration: BoxDecoration(
                        //color: const Color(0xffE2D3F5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _passwordController,
                        keyboardType: TextInputType.name,
                        validator: MyValidation().passwordValidation,
                        decoration: inputDecoration.copyWith(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color(0xff6F35A5),
                          ),
                          suffixIcon: const Icon(
                            Icons.visibility,
                            color: Color(0xff6F35A5),
                          ),
                          hintText: 'New Password',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 10*(context.width)/12,
                      decoration: BoxDecoration(
                        //color: const Color(0xffE2D3F5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _confirmPasswordController,
                        keyboardType: TextInputType.name,
                        validator: _validatePassword,
                        decoration: inputDecoration.copyWith(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color(0xff6F35A5),
                          ),
                          suffixIcon: const Icon(
                            Icons.visibility,
                            color: Color(0xff6F35A5),
                          ),
                          hintText: 'Confirm New Password',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_passwordController.text ==
                            _confirmPasswordController.text) {
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
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(const Color(0xff6F35A5)),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 79, vertical: 10),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Confirm",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: "myFont",
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        );
  }

  static  InputDecoration inputDecoration = InputDecoration(
    floatingLabelAlignment: FloatingLabelAlignment.start,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    border: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.purple,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
  );
}
