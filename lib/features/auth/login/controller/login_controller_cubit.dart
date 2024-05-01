import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../welcome/view/page/welcome_page.dart';



part 'login_controller_state.dart';
class LoginControllerCubit extends Cubit<LoginControllerState> {
  LoginControllerCubit() : super(LoginControllerInitial());

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onPressedConfirmButton(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WelcomePage()),
      );
    }
  }
}