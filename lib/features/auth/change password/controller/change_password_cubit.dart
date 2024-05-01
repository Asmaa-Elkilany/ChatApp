import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onPressedConfirmButton(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/verification');
    }
  }
}
