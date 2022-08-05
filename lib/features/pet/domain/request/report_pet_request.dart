class ReportPetRequest {
  String petId;
  String name;
  String address;
  String details;
  dynamic img;

  ReportPetRequest(
      {required this.petId,
      required this.name,
      required this.address,
      required this.details,
      required this.img});
}
