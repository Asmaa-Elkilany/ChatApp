import 'dart:developer';
import 'dart:typed_data';

class UsersModel {
  String? username;
  int? favorite, id;
  Uint8List? image;

  UsersModel.fromJson(Map m) {
    log(m.toString());
    username = m['username'];
    image = m['image'];
    favorite = m['favorite'];
    id = m['id'];
  }
}