
 import 'package:auth/features/dashboard/modules/users/model/repo/user_model.dart';

abstract class ParentRepo{
  Future<void> insert({required String email, String? password});
  Future<List<UserModel>>fetch();
  Future<void> delete({required int email});
}