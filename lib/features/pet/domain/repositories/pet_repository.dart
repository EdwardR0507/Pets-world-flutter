import '../entities/pet.dart';
import '../request/register_pet_request.dart';
import '../request/report_pet_request.dart';
import '../response/report_pet_response.dart';

abstract class IPetRepository {
  Future<List<Pet>> getPets();
  Future<List<Pet>> getPetsByOwnerId(String ownerId);
  Future<Pet> getPet(String petId);
  Future<Pet> registerPet(RegisterPetRequest petRequest);
  Future<String> checkPet(dynamic imgFromUser, dynamic imgPet);
  Future<ReportPetResponse> reportPet(ReportPetRequest reportRequest);
  Future<String> deletePet(String petId);
}
