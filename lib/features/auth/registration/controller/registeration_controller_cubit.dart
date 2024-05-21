
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../verification/view/page/verification_page.dart';
part 'registeration_controller_state.dart';

class RegistrationControllerCubit extends Cubit<RegisterationControllerState> {
  RegistrationControllerCubit() : super(RegisterationControllerInitial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onPressedConfirmButton(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const VerificationPage()),
      );
    }
  }
}