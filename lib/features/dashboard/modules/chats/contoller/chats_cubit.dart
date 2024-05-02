import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/entity_model/users_model.dart';
import '../model/repo/database_repo.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit() : super(ChatsStateLoading()){
    init();
  }
  List<UsersModel> users= [];
  DatabaseRepo repo = DatabaseRepo();
Future<void> init() async {
  emit(ChatsStateLoading());
 await repo.initDB();

 await repo.insertUser("Asmoaa", Uint8List(10));
  await repo.insertUser("Ayoya", Uint8List(10));
  await repo.insertUser("Aloaa", Uint8List(10));

  users = await repo.fetchUsers();
  if(users.isEmpty){
    emit(ChatsStateEmpty());
  } else{
    emit(ChatsStateLoaded());
  }
}

  void addChatToFavorite(int id, int value) {
    repo.updateFavorite(value,id);
    init();
    emit(ChatsStateLoaded());
  }

}
