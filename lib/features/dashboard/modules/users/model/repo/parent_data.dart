import 'package:auth/features/dashboard/modules/users/model/repo/parent_data.dart';




 abstract class ParentRepo{
  Future<void> insert({required String name, String? address});
  Future<List<UserModel>>fetch();
  Future<void> delete({required int id});
}