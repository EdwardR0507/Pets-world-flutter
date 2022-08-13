class ReportPetRequest {
  String reporterId;
  String petId;
  String address;
  String details;
  dynamic reportedImg;

  ReportPetRequest(
      {required this.reporterId,
      required this.petId,
      required this.address,
      required this.details,
      required this.reportedImg});
}
