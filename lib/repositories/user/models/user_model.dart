import 'dart:convert';

class UserModel {
  UserModel({
    required this.user,
  });

  final User user;

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "user": user.toMap(),
      };
}

class User {
  User({
    required this.address,
    required this.dni,
    required this.email,
    required this.fatherLastname,
    required this.id,
    required this.motherLastname,
    required this.name,
    required this.nickname,
    required this.password,
    required this.phoneNumber,
  });

  final String address;
  final String dni;
  final String email;
  final String fatherLastname;
  final String id;
  final String motherLastname;
  final String name;
  final String nickname;
  final String password;
  final String phoneNumber;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        address: json["address"],
        dni: json["dni"],
        email: json["email"],
        fatherLastname: json["father_lastname"],
        id: json["id"],
        motherLastname: json["mother_lastname"],
        name: json["name"],
        nickname: json["nickname"],
        password: json["password"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toMap() => {
        "address": address,
        "dni": dni,
        "email": email,
        "father_lastname": fatherLastname,
        "id": id,
        "mother_lastname": motherLastname,
        "name": name,
        "nickname": nickname,
        "password": password,
        "phone_number": phoneNumber,
      };
}
