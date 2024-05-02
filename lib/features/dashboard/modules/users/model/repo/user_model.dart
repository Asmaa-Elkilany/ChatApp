class UserModel {
  String? name;
  String? email;
  String? password;

  UserModel({this.name, this.email, this.password});

  UserModel.fromJson(Map map) {
    name = map['name'];
    email = map['email'];
    password = map['password'];
  }
}