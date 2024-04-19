

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../login/view/page/login_page.dart';
part 'verification_controller_state.dart';

class VerificationControllerCubit extends Cubit<VerificationControllerState> {
  VerificationControllerCubit() : super(VerificationControllerInitial());
  TextEditingController firstDigitController = TextEditingController();
  TextEditingController secondDigitController = TextEditingController();
  TextEditingController thirdDigitController = TextEditingController();
  TextEditingController fourthDigitController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onPressedConfirmButton(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }
}