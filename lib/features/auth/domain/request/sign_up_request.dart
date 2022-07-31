class SignUpRequest {
  dynamic previousData;
  String email;
  String nickname;
  String password;
  SignUpRequest({
    required this.previousData,
    required this.email,
    required this.nickname,
    required this.password,
  });
}
