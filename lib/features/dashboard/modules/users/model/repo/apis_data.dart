

import 'package:auth/features/dashboard/modules/users/model/repo/parent_data.dart';
import 'package:auth/features/dashboard/modules/users/model/repo/user_model.dart';

class APIs extends ParentRepo{
  
  @override
  Future<List<UserModel>> fetch() {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<void> delete({required int email}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> insert({required String email, String? password}) {
    // TODO: implement insert
    throw UnimplementedError();
  }
  
}