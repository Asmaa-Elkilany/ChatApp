import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.obscureText = false,
    this.controller,
    this.onChanged,
    this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
    this.label,
  });

  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? label;
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        label: label,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10),),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10),),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
      ),
        // border: OutlineInputBorder(
        //   borderSide: const BorderSide(
        //     color: Colors.grey,
        //     width: 2,
        //   ),
        //   borderRadius: BorderRadius.circular(30),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(
        //     color: Colors.blue,
        //     width: 2,
        //   ),
        //   borderRadius: BorderRadius.circular(30),
        // ),
        // errorBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(
        //     color: Colors.red,
        //     width: 2,
        //   ),
        //   borderRadius: BorderRadius.circular(30),
        // ),
      //),
    );
  }
}

// Widget _buildTextField({
//   required String hintText,
//   required IconData prefixIcon,
//   required String? Function(String?) validator,
//   required TextInputType keyboardType,
//   Function(dynamic value) ?onChanged,
// }) {
//   return;
// }
//
// Widget _buildPasswordField({
//   required String hintText,
//   required TextEditingController controller,
//   required String? Function(String?) validator,
//   Function(dynamic value) ?onChanged,
// }) {
//   return Container(
//     width: 430,
//     decoration: BoxDecoration(
//       //color: const Color(0xffE2D3F5),
//       borderRadius: BorderRadius.circular(30),
//     ),
//     child: TextFormField(
//       obscureText: true,
//       obscuringCharacter: '*',
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       controller: controller,
//       keyboardType: TextInputType.name,
//       validator: validator,
//       decoration: InputDecoration(
//         prefixIcon: const Icon(
//           Icons.lock,
//           color: Color(0xff6F35A5),
//         ),
//         suffixIcon: const Icon(
//           Icons.visibility,
//           color: Color(0xff6F35A5),
//         ),
//         hintText: hintText,
//         border: OutlineInputBorder(
//           borderSide: const BorderSide(
//             color: Colors.grey,
//             width: 2,
//           ),
//           borderRadius: BorderRadius.circular(30),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(
//             color: Colors.blue,
//             width: 2,
//           ),
//           borderRadius: BorderRadius.circular(30),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderSide: const BorderSide(
//             color: Colors.red,
//             width: 2,
//           ),
//           borderRadius: BorderRadius.circular(30),
//         ),
//       ),
//     ),
//   );
// }}
