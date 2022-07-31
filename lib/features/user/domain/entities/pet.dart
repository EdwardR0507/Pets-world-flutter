import 'dart:convert';

class Pet {
  Pet({
    required this.birthdate,
    required this.breed,
    required this.characteristics,
    required this.color,
    required this.gender,
    required this.id,
    required this.imgPublicId,
    required this.imgUrl,
    required this.name,
    required this.ownerId,
    required this.ownerName,
    required this.registeredAt,
    required this.size,
  });

  final String birthdate;
  final String breed;
  final String characteristics;
  final String color;
  final String gender;
  final String id;
  final String imgPublicId;
  final String imgUrl;
  final String name;
  final String ownerId;
  final String ownerName;
  final String registeredAt;
  final String size;

  factory Pet.fromJson(String str) => Pet.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pet.fromMap(Map<String, dynamic> json) => Pet(
        birthdate: json["birthdate"],
        breed: json["breed"],
        characteristics: json["characteristics"],
        color: json["color"],
        gender: json["gender"],
        id: json["id"],
        imgPublicId: json["img_public_id"],
        imgUrl: json["img_url"],
        name: json["name"],
        ownerId: json["owner_id"],
        ownerName: json["owner_name"],
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
        "img_public_id": imgPublicId,
        "img_url": imgUrl,
        "name": name,
        "owner_id": ownerId,
        "owner_name": ownerName,
        "registered_at": registeredAt,
        "size": size,
      };
}
