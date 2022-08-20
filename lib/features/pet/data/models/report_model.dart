import 'dart:convert';

import '../../domain/entities/report.dart';

class ReportModel extends Report {
  ReportModel({
    required this.address,
    required this.description,
    required this.id,
    required this.petId,
    required this.reportedImgPublicId,
    required this.reportedImgUrl,
    required this.reporterId,
  }) : super(
          address: address,
          description: description,
          id: id,
          petId: petId,
          reportedImgPublicId: reportedImgPublicId,
          reportedImgUrl: reportedImgUrl,
          reporterId: reporterId,
        );

  final String address;
  final String description;
  final String id;
  final String petId;
  final String reportedImgPublicId;
  final String reportedImgUrl;
  final String reporterId;

  factory ReportModel.fromJson(String str) =>
      ReportModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReportModel.fromMap(Map<String, dynamic> json) => ReportModel(
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

  @override
  String toString() {
    return 'ReportModel(address: $address, description: $description, id: $id, petId: $petId, reportedImgPublicId: $reportedImgPublicId, reportedImgUrl: $reportedImgUrl, reporterId: $reporterId)';
  }
}
