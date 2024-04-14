import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/validation.dart';



class RegisterationPage extends StatelessWidget{
  RegisterationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: ListView(
                  children: [
                    const SizedBox(height: 35,),
                    const Text('Signup',
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: "myFont",
                      ),
                    ),
                    const SizedBox(height: 20,),
                    SvgPicture.asset("images/assets/icons/signup.svg",width: 250,height: 250,),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 430,
                      decoration: BoxDecoration(
                        color: const Color(0xffE2D3F5), // Set the background color here
                        borderRadius: BorderRadius.circular(30), // Optional: You can adjust the border radius
                      ),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: TextEditingController(),
                        keyboardType: TextInputType.name,
                        validator: MyValidation().nameValidation,
                        decoration: inputDecoration.copyWith(
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Color(0xff6F35A5),
                          ),
                          hintText: 'User name',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      width: 430,
                      decoration: BoxDecoration(
                        color: const Color(0xffE2D3F5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: TextEditingController(),
                        keyboardType: TextInputType.name,
                        validator: MyValidation().emailValidation,
                        decoration: inputDecoration.copyWith(
                          prefixIcon: const Icon(
                            Icons.mail,
                            color: Color(0xff6F35A5),
                          ),
                          hintText: 'pesron@gmail.com',
                        ),
                      ),
                    ),

                    const SizedBox(height: 20,),
                    Container(
                      width: 430,
                      decoration: BoxDecoration(
                        color: const Color(0xffE2D3F5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: TextEditingController(),
                        keyboardType: TextInputType.name,
                        validator: MyValidation().passwordValidation,
                        decoration: inputDecoration.copyWith(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color(0xff6F35A5),
                          ),
                          suffixIcon: const Icon(Icons.visibility,
                            color: Color(0xff6F35A5),
                          ),
                          hintText: 'xxxxxxxx',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      width: 430,
                      decoration: BoxDecoration(
                        color: const Color(0xffE2D3F5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: TextEditingController(),
                        keyboardType: TextInputType.name,
                        validator: MyValidation().passwordValidation,
                        decoration: inputDecoration.copyWith(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color(0xff6F35A5),
                          ),
                          suffixIcon: const Icon(Icons.visibility,
                            color: Color(0xff6F35A5),
                          ),
                          hintText: 'confirm password',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: (){
                        //Navigator.pushNamed(context, "");
                      },
                      style: ButtonStyle(
                        backgroundColor:MaterialStateProperty.all(const Color(0xff6F35A5),) ,
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 100,vertical: 10),
                        ),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27),
                        ),
                        ),
                      ),
                      child: const Text(
                        "Signup",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('have an account? '),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, "/login");
                          },
                          child: const Text('login',
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
                child:Image.asset("images/assets/images/signup_top.png",height: 150,),
              ),
            ],
          ),
        ),
      ),
    );
  }
  InputDecoration inputDecoration=InputDecoration(
    floatingLabelAlignment: FloatingLabelAlignment.start,
    floatingLabelBehavior: FloatingLabelBehavior.always,
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
  );
}