

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'verification_controller_state.dart';

class VerificationControllerCubit extends Cubit<VerificationControllerState> {
  VerificationControllerCubit() : super(VerificationControllerInitial());
  TextEditingController pinCodeController = TextEditingController();
  void onTapConfirm(){
    const String validCode="22222";
    if(pinCodeController.text==validCode) {
      print('valid');
    } else {
      print('invalid');
    }
  }
  /*GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onPressedConfirmButton(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }*/
}