import 'package:flutter/material.dart';


class ChatWidget extends StatelessWidget {
  static const String screenRoute='chat_screen';
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
        title: Row(
          children: [
            /*
            Image.asset("images/assets/images/logo.png",
              height: 25,
            ),
            const SizedBox(width: 10,),
            const Text("Message me",
              style: TextStyle(
                color: Colors.white,
              ),),*/
            const Text("Message me",
              style: TextStyle(
                color: Colors.white,
              ),),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              //add logout function here
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.purple.shade700,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        hintText: "Write your message here....",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Send',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // This widget ias the root of your application.

}

