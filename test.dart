import 'package:auth/features/auth/verification/controller/verification_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

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
                'Verification',
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: "myFont",
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 80,
                  fieldWidth: 50,
                  activeFillColor: const Color(0xffE2D3F5),
                ),
                animationDuration: const Duration(milliseconds: 300),
                //backgroundColor: Colors.purple,
                enableActiveFill: true,
                //errorAnimationController: errorController,
                controller: controller.pinCodeController,
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
              const SizedBox(height: 50),
/*            ElevatedButton(
                onPressed: (){
          Navigator.pushNamed(context, "/login");
                },
                style: ButtonStyle(
          backgroundColor:MaterialStateProperty.all(const Color(0xff6F35A5),) ,
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 79,vertical: 10),
          ),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27),
          ),
          ),
                ),

                child: const Text(
          "Login",
          style: TextStyle(
            fontSize: 24,
            fontFamily: "myFont",
            color: Colors.white,
          ),
                ),
              ),*/
              const SizedBox(
                height: 20,
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
