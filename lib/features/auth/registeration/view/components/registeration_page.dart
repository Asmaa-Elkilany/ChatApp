import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/validation.dart';

class RegisterationPage extends StatelessWidget {
  const RegisterationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

    String? validatePassword(String? value) {
      if (value != passwordController.text) {
        return 'Passwords do not match';
      }
      return null;
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 35,),
                const Text(
                  'Signup',
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: "myFont",
                  ),
                ),
                const SizedBox(height: 20,),
                SvgPicture.asset(
                  "images/assets/icons/signup.svg",
                  width: 250,
                  height: 250,
                ),
                const SizedBox(height: 20,),
                _buildTextField(
                  hintText: 'User name',
                  prefixIcon: Icons.person,
                  validator: MyValidation().nameValidation,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 20,),
                _buildTextField(
                  hintText: 'pesron@gmail.com',
                  prefixIcon: Icons.mail,
                  validator: MyValidation().emailValidation,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20,),
                _buildPasswordField(
                  hintText: 'Password',
                  controller: passwordController,
                  validator: MyValidation().passwordValidation,
                ),
                const SizedBox(height: 20,),
                _buildPasswordField(
                  hintText: 'Confirm Password',
                  controller: confirmPasswordController,
                  validator: validatePassword,
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    // Perform signup logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff6F35A5),
                    padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 10),
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
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? '),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/login");
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
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required IconData prefixIcon,
    required String? Function(String?) validator,
    required TextInputType keyboardType,
  }) {
    return Container(
      width: 430,
      decoration: BoxDecoration(
        color: const Color(0xffE2D3F5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: TextEditingController(),
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: const Color(0xff6F35A5),
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required String hintText,
    required TextEditingController controller,
    required String? Function(String?) validator,
  }) {
    return Container(
      width: 430,
      decoration: BoxDecoration(
        color: const Color(0xffE2D3F5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        obscureText: true,
        obscuringCharacter: '*',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        keyboardType: TextInputType.name,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.lock,
            color: Color(0xff6F35A5),
          ),
          suffixIcon: const Icon(
            Icons.visibility,
            color: Color(0xff6F35A5),
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
