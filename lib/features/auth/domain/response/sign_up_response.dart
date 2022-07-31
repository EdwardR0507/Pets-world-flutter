import 'dart:convert';

import 'package:pets_world/features/auth/domain/entities/user.dart';

class SignUpResponse {
  SignUpResponse({
    required this.msg,
    required this.token,
    required this.user,
  });

  final String msg;
  final String token;
  final User user;

  factory SignUpResponse.fromJson(String str) =>
      SignUpResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SignUpResponse.fromMap(Map<String, dynamic> json) => SignUpResponse(
        msg: json["msg"],
        token: json["token"],
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "msg": msg,
        "token": token,
        "user": user.toMap(),
      };
}
