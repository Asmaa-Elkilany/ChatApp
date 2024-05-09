import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../chats/contoller/chats_cubit.dart';
import '../../chats/model/repo/database_repo.dart';

part 'new_chat_state.dart';

class NewChatCubit extends Cubit<NewChatState> {
  NewChatCubit() : super(NewChatInitial());
  TextEditingController nameController = TextEditingController();
  XFile? image;

  Future<void> pickPersonImage() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    image = await picker.pickImage(source: ImageSource.gallery);

    emit(NewChatInitial());
  }

  Future<void> takePersonImage() async {
    final ImagePicker picker = ImagePicker();
// take an image.
    image = await picker.pickImage(source: ImageSource.camera);
    emit(NewChatInitial());
  }

  Future<void> addPerson(context) async {
    DatabaseRepo db = DatabaseRepo();
    await db.initDB();
    await db.insertUser(
      nameController.text,
      await image!.readAsBytes(),
    );
    await ChatsCubit.instance.init();
Navigator.pop(context);
  }


}
