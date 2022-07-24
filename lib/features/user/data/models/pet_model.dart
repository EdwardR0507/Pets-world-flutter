import 'dart:convert';

class PetModel {
  PetModel({
    required this.birthdate,
    required this.breed,
    required this.characteristics,
    required this.color,
    required this.gender,
    required this.id,
    required this.name,
    required this.ownerId,
    required this.registeredAt,
    required this.size,
  });

  final String birthdate;
  final String breed;
  final String characteristics;
  final String color;
  final String gender;
  final String id;
  final String name;
  final String ownerId;
  final String registeredAt;
  final String size;

  factory PetModel.fromJson(String str) => PetModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PetModel.fromMap(Map<String, dynamic> json) => PetModel(
        birthdate: json["birthdate"],
        breed: json["breed"],
        characteristics: json["characteristics"],
        color: json["color"],
        gender: json["gender"],
        id: json["id"],
        name: json["name"],
        ownerId: json["owner_id"],
        registeredAt: json["registered_at"],
        size: json["size"],
      );

  Map<String, dynamic> toMap() => {
        "birthdate": birthdate,
        "breed": breed,
        "characteristics": characteristics,
        "color": color,
        "gender": gender,
        "id": id,
        "name": name,
        "owner_id": ownerId,
        "registered_at": registeredAt,
        "size": size,
      };
}
