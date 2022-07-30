import '../../data/models/pet_model.dart';

abstract class IPetRepository {
  Future<List<Pet>> getPets();
  Future<Pet> getPet(String id);
  Future<void> registerPet(Pet pet);
  Future<void> deletePet(String id);
}
