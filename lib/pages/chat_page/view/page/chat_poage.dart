import 'package:flutter/material.dart';

import '../components/chat_widgets.dart';
class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ChatWidget(),
      ),
    );
  }
}