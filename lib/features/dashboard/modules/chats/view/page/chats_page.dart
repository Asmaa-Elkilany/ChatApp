import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../contoller/chats_cubit.dart';
import '../components/users_item_widget.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ChatsCubit.instance,
      child: BlocBuilder<ChatsCubit, ChatsState>(
        builder: (context, state) {
          final ChatsCubit controller = context.read<ChatsCubit>();
          return Scaffold(
            body: state is ChatsStateLoading? const CircularProgressIndicator():
                state is ChatsStateEmpty ?  const Center(child: Icon(CupertinoIcons.delete, size: 100,)):
            ListView.builder(
              itemBuilder:(_, int index) => UserItemWidget(
                  usersModel:controller.users[index],
              controller: controller,
              ),
              itemCount: controller.users.length,
            ),
          );
        },
      ),
    );
  }
}
