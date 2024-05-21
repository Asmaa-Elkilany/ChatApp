import 'package:flutter/material.dart';
import 'package:project_flutter/core/utils/context_extension.dart';

import '../../../../../core/utils/validation.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/my_button.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SizedBox(
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            const Text(
              "Forget Password",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                color: Color(0xff2e386b),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              prefixIcon: const Icon(Icons.email, color: Color(0xff2e386b)),
              hintText: 'pesron@gmail.com',
              validator: MyValidation().emailValidation,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
              color: Colors.blue[800]!,
              title: "Confirm",
              onPressed: () {
                Navigator.pushNamed(context, 'change');
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
