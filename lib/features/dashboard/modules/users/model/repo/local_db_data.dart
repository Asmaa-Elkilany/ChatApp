

import 'package:auth/features/dashboard/modules/users/model/repo/parent_data.dart';
import 'package:auth/features/dashboard/modules/users/model/repo/user_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepo extends ParentRepo{

  DatabaseRepo._init();
  static DatabaseRepo ? _singleToneObject;
  static late Database _database;
  static Future<DatabaseRepo> get instance async{
    if(_singleToneObject==null){
      await _initDatabase();
      _singleToneObject =DatabaseRepo._init();
    }
    return _singleToneObject!;
  }

  ///create database
  static Future<void> _initDatabase() async {
    ///get database path on the target device
    final String databasePath = await getDatabasesPath();

    ///add your database files
    final String path = databasePath + "/users.db";
    // final path = join(databasePath, 'users.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createTables,
    );
  }
  //id INTEGER PRIMARY KEY AUTOINCREMENT,
  static Future<void> _createTables(Database db, _) async {
    await db.execute("""
CREATE TABLE user (
name TEXT NOT NULL, 
email TEXT NOT NULL,
password TEXT NOT NULL
)
""");
  }



  @override
  Future<List<UserModel>> fetch() async {
    return (await _database.query('user')).map((e) => UserModel.fromJson(e)).toList();
        
  }

  @override
  Future<void> delete({required int email}) async {
    await _database.delete('user', where: 'email=?', whereArgs: [email]);
  }

  @override
  Future<void> insert({required String email, String? password}) async {
    await _database.insert('user', {'email': email, 'password': password});
  }
  
  
}