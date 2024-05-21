import 'package:chaaaaaaaaaaaaaaaaaaaaat/core/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/validation.dart';

class LoginWidget extends StatelessWidget{
  LoginWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 35,),
                    const Text('Login',
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: "myFont",
                      ),
                    ),
                    const SizedBox(height: 20,),
                   Image.asset("images/assets/images/mob_login.png",
                   width: context.width,
                   ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: context.width,
                      decoration: BoxDecoration(
                        //color: const Color(0xffE2D3F5), // Set the background color here
                        borderRadius: BorderRadius.circular(30), // Optional: You can adjust the border radius
                      ),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: TextEditingController(),
                        keyboardType: TextInputType.name,
                        validator: MyValidation().emailValidation,
                        decoration: decoration.copyWith(
                          label: const Text("Mail"),
                          hintText:"xxxx@gmial.com",
                          prefixIcon: const Icon(Icons.mail),
                        )
                      ),
                    ),

                    const SizedBox(height: 20,),
                    Container(
                      width: 430,
                      decoration: BoxDecoration(
                        //color: const Color(0xffE2D3F5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: TextEditingController(),
                        keyboardType: TextInputType.name,
                        validator: MyValidation().passwordValidation,
                        decoration: decoration.copyWith(
                          label: const Text("Password"),
                          hintText: 'xxxxxxxx',
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color(0xff6F35A5),
                          ),
                          suffixIcon: const Icon(
                            Icons.visibility,
                            color: Color(0xff6F35A5)
                          ),
                        )
                      ),
                    ),
                      const SizedBox(
                      height: 20,
                     ),


                    ElevatedButton(
                      onPressed: (){
                        Navigator.pushNamed(context, 'dashboard');
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
                    ),

                    const SizedBox(height: 20,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, 'forget');
                          },
                          child: const Text('Forget password?',
                            style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontFamily: "myFont",
                            ),
                          ),
                        ),
                        const Text("     OR     ",),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, 'signup');
                          },
                          child: const Text('Create Account!',
                            style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontFamily: "myFont",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child:Image.asset("images/assets/images/main_top.png",height: 150,),
              ),
            ],
          ),
        );
  }
  InputDecoration decoration =  InputDecoration(

      border: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Colors.grey,
              width: 2
          ),
          borderRadius: BorderRadius.circular(30)
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Colors.purple,
              width: 2
          ),
          borderRadius: BorderRadius.circular(30)
      ),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Colors.red,
              width: 2
          ),
          borderRadius: BorderRadius.circular(30)
      )
  );



}