
import 'package:auth/features/auth/verification/view/page/verification_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'registeration_controller_state.dart';

class RegisterationControllerCubit extends Cubit<RegisterationControllerState> {
  RegisterationControllerCubit() : super(RegisterationControllerInitial());
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
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