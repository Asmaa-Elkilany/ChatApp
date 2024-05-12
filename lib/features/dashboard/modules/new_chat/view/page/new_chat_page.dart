import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/new_chat_cubit.dart';

class NewChatPage extends StatelessWidget {
  const NewChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>NewChatCubit(),
      child: BlocBuilder<NewChatCubit, NewChatState>(
        builder: (context, state) {
          final NewChatCubit cubit = context.read<NewChatCubit>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: const Text('Add new Profile'),

            ),

            body: Column(

              children: [
                 const SizedBox(
                   height: 10,
                 ),
                const Text('Name'),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  controller: cubit.nameController,
                ),

                Row(
                  children: [
                    IconButton(onPressed: cubit.pickPersonImage, icon: const Icon(CupertinoIcons.photo)),
                    IconButton(onPressed: cubit.takePersonImage, icon: const Icon(CupertinoIcons.camera)),
                  ],
                ),

               if (cubit.image != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.file(File(cubit.image!.path),
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),

                const Spacer(),
                TextButton(onPressed: () => cubit.addPerson(context), child: const Text("Add Person"))
              ],
            ),
          );
        },
      ),
    );
  }
}