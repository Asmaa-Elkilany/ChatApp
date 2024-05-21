import 'package:project_flutter/core/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/widgets/my_button.dart';
import '../../controller/verification_controller_cubit.dart';

class VerificationWidget extends StatelessWidget {
  const VerificationWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerificationControllerCubit(),
      child:
      BlocBuilder<VerificationControllerCubit, VerificationControllerState>(
        builder: (context, state) {
          final VerificationControllerCubit controller =
          context.read<VerificationControllerCubit>();
          return Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              const Text(
                "Verification",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: Color(0xff2e386b),
                ),
              ),
              // Image.asset("assets/images/verification.png",
              //     width: context.width,
              //     height:context.height/2.7
              // ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Enter the OTP send to your phone number',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              PinCodeTextField(
                length: 4,
                obscureText: false,
                appContext: context,
                animationType: AnimationType.fade,
                mainAxisAlignment: MainAxisAlignment.center,
                validator: (v) {
                  if (v!.length < 3) {
                    return "I am from validator";
                  } else {
                    return null;
                  }
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(20),
                  fieldHeight: 80,
                  fieldWidth: 50,
                  activeFillColor: Colors.blue[100],
                  inactiveFillColor: Colors.blue[100],
                  activeColor: Colors.white,
                  fieldOuterPadding: const EdgeInsets.only(left: 20),
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                controller: controller.pinCodeController,
                keyboardType: TextInputType.number,
                onCompleted: (v) {
                  print("Completed");
                }, /*
              onChanged: (value) {
                print(value);
                setState(() {
                  currentText = value;
                });
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },*/
              ),
              const SizedBox(height: 20),
              MyButton(
                color: Colors.blue[800]!,
                title: "Confirm",
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        },
      ),
    );
  }
}
