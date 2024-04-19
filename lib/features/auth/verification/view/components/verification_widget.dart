import 'package:flutter/material.dart';
class VerificationWidget extends StatelessWidget{
  VerificationWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
        children: [
        const SizedBox(height: 35,),
    const Text('Verification',
    style: TextStyle(
    fontSize: 35,
    fontFamily: "myFont",
    fontWeight: FontWeight.bold,
    ),
    ),
    const SizedBox(
    height: 20,
    ),
    const Text('Enter the OTP send to your phone number',
    style: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.black,
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
    maxLength: 1,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: TextEditingController(),
    keyboardType: TextInputType.name,
    decoration: inputDecoration,
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
    maxLength: 1,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: TextEditingController(),
    keyboardType: TextInputType.name,
    decoration: inputDecoration,
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
    maxLength: 1,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: TextEditingController(),
    keyboardType: TextInputType.name,
    decoration: inputDecoration,
    ),
    ),
    const SizedBox(height: 20,),
    Container(
    width: 430,
    height: 70,
    decoration: BoxDecoration(
    color: const Color(0xffE2D3F5),
    borderRadius: BorderRadius.circular(30),
    ),
    child: TextFormField(
    maxLength: 1,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: TextEditingController(),
    keyboardType: TextInputType.name,
    decoration: inputDecoration,
    ),
    ),
    const SizedBox(height: 50),
    ElevatedButton(
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
    ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(height: 20,),
        ],
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
