import 'package:chaaaaaaaaaaaaaaaaaaaaat/core/utils/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/validation.dart';

class ForgetPasswordWidget extends StatelessWidget{
  const ForgetPasswordWidget({super.key});
  @override
  Widget build(BuildContext context) {
   return SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 35,),
                    const Text('Forget password',
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: "myFont",
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset("images/assets/images/Forgot password-cuate.png",
                      width: context.width,
                      height:context.height/2.2
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: (10*context.width)/12,
                      decoration: BoxDecoration(
                        color: const Color(0xffE2D3F5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: TextEditingController(),
                        keyboardType: TextInputType.name,
                        validator: MyValidation().emailValidation,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.mail,
                            color: Color(0xff6F35A5),
                          ),
                          hintText: 'pesron@gmail.com',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.purple,
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
                    ),

                    const SizedBox(height: 20,),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.pushNamed(context, 'change');
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
                        "Confirm",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: "myFont",
                          color: Colors.white,
                        ),
                      ),

                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
            ],
          ),
        );
  }

}