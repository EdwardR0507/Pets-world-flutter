import '../entities/pet.dart';
import '../entities/report.dart';
import '../request/register_pet_request.dart';
import '../request/report_pet_request.dart';

abstract class IPetRepository {
  Future<List<Pet>> getPets();
  Future<List<Pet>> getPetsByOwnerId(String ownerId);
  Future<Pet> getPet(String petId);
  Future<Pet> registerPet(RegisterPetRequest petRequest);
  Future<String> checkPet(dynamic imgFromUser);
  Future<Report> reportPet(ReportPetRequest reportRequest);
  Future<String> deletePet(String petId);
  Future<List<Pet>> getReportedPetsByOwnerId(String ownerId);
  Future<Report> getReport(String petId);
  Future<String> deleteReportedPet(String reportId);
}
