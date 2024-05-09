import 'dart:typed_data';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../entity_model/users_model.dart';
class DatabaseRepo {
  late Database _database;

  Future<void> initDB() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'chat_database.db'),
      version: 1,
      onCreate: (db, version) async {
        // Create tables
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT NOT NULL,
            favorite INTEGER,
            image BLOB
          )
        ''');
        await db.execute('''
          CREATE TABLE messages (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            sender_id INTEGER,
            receiver_id INTEGER,
            message TEXT NOT NULL,
            timestamp TEXT
          )
        ''');
      },
    );
  }

  Future<List<UsersModel>> fetchUsers() async {
    return (await _database.query('users')).map((e) => UsersModel.fromJson(e)).toList();
  }


  Future<List<UsersModel>> fetchFavouriteUsers() async {
    return (await _database.query('users', where: 'favorite=?',whereArgs :[1])).map((e) => UsersModel.fromJson(e)).toList();
  }



  // Method to close the database
  /* Future<void> closeDB() async {
    await _database.close();
  }*/


  Future<void> insertUser(String name, Uint8List image) async {
   // String base64Image = base64Encode(image);
    await _database.insert('users', {
      'username': name,
      'image': image,
      'favorite': 0,
    });
  }

  Future<void> insertMessage(Message message) async {
    await _database.insert('messages', message.toMap());
  }
/// /
  Future<List<Message>> getMessages() async {
    final List<Map<String, dynamic>> messageMaps = await _database.query(
        'messages');
    return List.generate(messageMaps.length, (i) {
      return Message(
        id: messageMaps[i]['id'],
        senderId: messageMaps[i]['sender_id'],
        receiverId: messageMaps[i]['receiver_id'],
        message: messageMaps[i]['message'],
        timestamp: messageMaps[i]['timestamp'],
      );
    });
  }

  Future<void> updateFavorite(int value, int id) async {
    await _database.update(
        'users',
        {
          'favorite': value,
        },
        where: 'id=?',
        whereArgs: [id]);
  }

  void deleteUser(int id) {
    _database.delete('users', where: 'id=?', whereArgs: [id]);
  }


}
class Message {
  int id;
  int senderId;
  int receiverId;
  String message;
  int timestamp;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp,
    };
  }
}
