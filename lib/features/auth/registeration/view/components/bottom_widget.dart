import 'package:flutter/material.dart';
class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
         FilledButton(
        style: const ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.orange)),
             onPressed:(){
           //navigate to verification
                  },
             child:
         const Text("Confirm")
         ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
           children: [
            const Text("Already have an account?"),
             InkWell(
               onTap: (){
               },
               child: const Text("Login",
               style: TextStyle(
                 color:Colors.orange,
                 decorationStyle: TextDecorationStyle.solid,
                 decoration: TextDecoration.underline,
                 decorationThickness: 3,
                 decorationColor: Colors.orange

               ) ,
               ),
             )
           ],
         )
       ],
    );
  }
}
