import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.yellow[900],
      title: Row(
        children: [
          Image.asset(
            "assets/images/logo.jpg",
            height: 25,
          ),
          const SizedBox(width: 10),
          const Text(
            "Message me",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            // add logout function here
          },
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }
}
