class RegisterPetRequest {
  String name;
  String gender;
  String color;
  String breed;
  String characteristics;
  String size;
  String userId;
  String birthdate;
  dynamic img;

  RegisterPetRequest(
      {required this.name,
      required this.gender,
      required this.breed,
      required this.color,
      required this.size,
      required this.userId,
      required this.birthdate,
      required this.characteristics,
      required this.img});
}
