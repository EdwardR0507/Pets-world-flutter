import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../../utils/base_url.dart';
import '../../domain/entities/pet.dart';
import '../../domain/exceptions/pet_exception.dart';
import '../../domain/repositories/pet_repository.dart';
import '../../domain/request/register_pet_request.dart';

class PetRepositoryImpl extends IPetRepository {
  @override
  Future<List<Pet>> getPets() async {
    try {
      var url = Uri.parse('${baseUrl}pets');
      var response = await http.get(url);
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        final data =
            (res['pets'] as List).map((pet) => Pet.fromMap(pet)).toList();
        return data;
      } else {
        throw PetException(res['msg']);
      }
    } catch (e) {
      throw PetException(e.toString());
    }
  }

  @override
  Future<Pet> getPet(String id) async {
    try {
      var url = Uri.parse('${baseUrl}pet?id=$id');
      var response = await http.get(url);
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        final data = Pet.fromMap(res['pet']);
        return data;
      } else {
        throw PetException(res['msg']);
      }
    } catch (e) {
      throw PetException(e.toString());
    }
  }

  @override
  Future<void> deletePet(String id) {
    // TODO: implement deletePet
    throw UnimplementedError();
  }

  @override
  Future<Pet> registerPet(RegisterPetRequest petRequest) async {
    try {
      var url = Uri.parse('${baseUrl}pet/register');
      var request = http.MultipartRequest("POST", url);
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
      });
      request.files.add(http.MultipartFile.fromBytes('img', petRequest.img,
          contentType: MediaType('application', 'json'), filename: "img.jpg"));
      request.fields['name'] = petRequest.name;
      request.fields['gender'] = petRequest.gender;
      request.fields['color'] = petRequest.color;
      request.fields['breed'] = petRequest.breed;
      request.fields['characteristics'] = petRequest.characteristics;
      request.fields['size'] = petRequest.size;
      request.fields['owner_id'] = petRequest.userId;
      request.fields['birthdate'] = petRequest.birthdate;

      http.Response response =
          await http.Response.fromStream(await request.send());
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        final data = Pet.fromMap(res['pet']);
        return data;
      } else {
        throw PetException(res['msg']);
      }
    } catch (e) {
      throw PetException(e.toString());
    }
  }
}
