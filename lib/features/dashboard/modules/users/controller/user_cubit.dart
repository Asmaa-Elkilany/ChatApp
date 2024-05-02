import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../model/repo/firebase_data.dart';
import '../model/repo/local_db_data.dart';
import '../model/repo/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserLoading()) {
    init();
  }

  List<UserModel> users = [];
  Future<void> init() async {
    emit(UserLoading());
    users = await (await DatabaseRepo.instance).fetch();
    //users = (await FirebaseRepo.instance?.fetch())!;
    if (users.isEmpty) {
      emit(UserEmpty());
    } else {
      emit(UserLoaded());
    }
  }
}
