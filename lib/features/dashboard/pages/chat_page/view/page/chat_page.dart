
import 'package:chaaaaaaaaaaaaaaaaaaaaat/features/dashboard/core/extentions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubit/parent_cubit.dart';
import '../components/chat_widgets.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ParentCubit.instance,
      child: BlocBuilder<ParentCubit, ParentState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Image.asset(
                    "assets/images/logo.jpg",
                    height: 25,
                  ),
                  const SizedBox(width: 10),
                   Text(
                     'chat_page_title'.tr,
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

            ),
            body: const ChatWidget(),
          );
        },
      ),
    );
  }
}
