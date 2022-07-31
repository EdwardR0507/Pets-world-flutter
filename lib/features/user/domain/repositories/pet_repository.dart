import 'package:pets_world/features/user/domain/entities/pet.dart';
import 'package:pets_world/features/user/domain/request/register_pet_request.dart';

abstract class IPetRepository {
  Future<List<Pet>> getPets();
  Future<Pet> getPet(String id);
  Future<Pet> registerPet(RegisterPetRequest petRequest);
  Future<void> deletePet(String id);
}
