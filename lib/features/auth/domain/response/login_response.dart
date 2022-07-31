import 'dart:convert';

import '../entities/user.dart';

class LoginResponse {
  LoginResponse({
    required this.token,
    required this.user,
  });

  final String token;
  final User user;

  factory LoginResponse.fromJson(String str) =>
      LoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "user": user.toMap(),
      };
}
