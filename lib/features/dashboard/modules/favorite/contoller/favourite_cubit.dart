
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../chats/contoller/chats_cubit.dart';
import '../../chats/model/entity_model/users_model.dart';
import '../../chats/model/repo/database_repo.dart';


part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteStateLoading()){
    init();
  }

  List<UsersModel> users= [];

  DatabaseRepo repo = DatabaseRepo();
Future<void> init() async {
  emit(FavoriteStateLoading());
 await repo.initDB();
/*
 await repo.insertUser("Asmaa", Uint8List(10));
  await repo.insertUser("Alaa", Uint8List(10));
  await repo.insertUser("Aya", Uint8List(10));
*/
  users = await repo.fetchFavouriteUsers();
  if(users.isEmpty){
    emit(FavoriteStateEmpty());
  } else{
    emit(FavoriteStateLoaded());
  }
}

  void addChatToFavorite(int id, int value) async {
   await repo.updateFavorite(value,id);
    await init();
    await ChatsCubit.instance.init();
    emit(FavoriteStateLoaded());
  }

}



