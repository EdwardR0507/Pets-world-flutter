import 'package:pets_world/features/user/domain/entities/pet.dart';
import 'package:pets_world/features/user/domain/request/register_pet_request.dart';

abstract class IPetRepository {
  Future<List<Pet>> getPets();
  Future<List<Pet>> getPetsByOwnerId(String ownerId);
  Future<Pet> getPet(String petId);
  Future<Pet> registerPet(RegisterPetRequest petRequest);
  Future<String> deletePet(String petId);
}
