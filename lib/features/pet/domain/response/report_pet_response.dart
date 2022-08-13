import 'dart:convert';

class ReportPetResponse {
  ReportPetResponse({
    required this.address,
    required this.description,
    required this.id,
    required this.petId,
    required this.reportedImgPublicId,
    required this.reportedImgUrl,
    required this.reporterId,
  });

  final String address;
  final String description;
  final String id;
  final String petId;
  final String reportedImgPublicId;
  final String reportedImgUrl;
  final String reporterId;

  factory ReportPetResponse.fromJson(String str) =>
      ReportPetResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReportPetResponse.fromMap(Map<String, dynamic> json) =>
      ReportPetResponse(
        address: json["address"],
        description: json["description"],
        id: json["id"],
        petId: json["pet_id"],
        reportedImgPublicId: json["reported_img_public_id"],
        reportedImgUrl: json["reported_img_url"],
        reporterId: json["reporter_id"],
      );

  Map<String, dynamic> toMap() => {
        "address": address,
        "description": description,
        "id": id,
        "pet_id": petId,
        "reported_img_public_id": reportedImgPublicId,
        "reported_img_url": reportedImgUrl,
        "reporter_id": reporterId,
      };
}
