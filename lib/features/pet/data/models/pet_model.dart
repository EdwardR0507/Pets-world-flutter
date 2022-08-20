import 'dart:convert';

import '../../domain/entities/pet.dart';

class PetModel extends Pet {
  PetModel({
    required this.birthdate,
    required this.breed,
    required this.characteristics,
    required this.color,
    required this.gender,
    required this.id,
    required this.isReported,
    required this.imgPublicId,
    required this.imgUrl,
    required this.name,
    required this.ownerId,
    required this.ownerName,
    required this.registeredAt,
    required this.size,
  }) : super(
            birthdate: birthdate,
            breed: breed,
            characteristics: characteristics,
            color: color,
            gender: gender,
            id: id,
            isReported: isReported,
            imgPublicId: imgPublicId,
            imgUrl: imgUrl,
            name: name,
            ownerId: ownerId,
            ownerName: ownerName,
            registeredAt: registeredAt,
            size: size);

  final String birthdate;
  final String breed;
  final String characteristics;
  final String color;
  final String gender;
  final String id;
  final bool isReported;
  final String imgPublicId;
  final String imgUrl;
  final String name;
  final String ownerId;
  final String ownerName;
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
        isReported: json["is_reported"],
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
        "is_reported": isReported,
        "img_public_id": imgPublicId,
        "img_url": imgUrl,
        "name": name,
        "owner_id": ownerId,
        "owner_name": ownerName,
        "registered_at": registeredAt,
        "size": size,
      };
}
