

import 'package:auth/features/dashboard/modules/users/model/repo/parent_data.dart';

class DatabaseRepo extends ParentRepo{

  DatabaseRepo._init();
  static DatabaseRepo ? _singleToneObject;
  static late Database _dataBase;
  static Future<DatabaseRepo> get instance async{
    if(_singleToneObject==null){
      await _initDatabase();
      _singleToneObject =DatabaseRepo._init();
    }
    return _singleToneObject!;
  }



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