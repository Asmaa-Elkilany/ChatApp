

import 'package:auth/features/dashboard/modules/users/model/repo/parent_data.dart';

class FirebaseRepo extends ParentRepo{
   static FirebaseRepo? instance=  FirebaseRepo._init();

   FirebaseRepo._init();
  /* static FirebaseRepo get instance{
     _singleToneObject ??=FirebaseRepo._init();
     return _singleToneObject!;
   }*/


  @override
  Future<void> delete({required int id}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<dynamic>> fetch() {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<void> insert({required String name, String? address}) {
    // TODO: implement insert
    throw UnimplementedError();
  }
  
}