import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../../utils/base_url.dart';
import '../../domain/entities/pet.dart';
import '../../domain/exceptions/pet_exception.dart';
import '../../domain/repositories/pet_repository.dart';
import '../../domain/request/register_pet_request.dart';
import '../../domain/request/report_pet_request.dart';
import '../../domain/response/report_pet_response.dart';
import '../models/pet_model.dart';

class PetRepositoryImpl extends IPetRepository {
  @override
  Future<List<Pet>> getPets() async {
    try {
      var url = Uri.parse('${baseUrl}pets/all');
      var response = await http.get(url);
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        final data =
            (res['pets'] as List).map((pet) => PetModel.fromMap(pet)).toList();
        return data;
      } else {
        throw PetException(res['msg']);
      }
    } catch (e) {
      throw PetException(e.toString());
    }
  }

  @override
  Future<List<Pet>> getPetsByOwnerId(String ownerId) async {
    try {
      var url = Uri.parse('${baseUrl}pets?owner_id=$ownerId');
      var response = await http.get(url);
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        final data =
            (res['pets'] as List).map((pet) => PetModel.fromMap(pet)).toList();
        return data;
      } else {
        throw PetException(res['msg']);
      }
    } catch (e) {
      throw PetException(e.toString());
    }
  }

  @override
  Future<Pet> getPet(String petId) async {
    try {
      var url = Uri.parse('${baseUrl}pet?id=$petId');
      var response = await http.get(url);
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        final data = PetModel.fromMap(res['pet']);
        return data;
      } else {
        throw PetException(res['msg']);
      }
    } catch (e) {
      throw PetException(e.toString());
    }
  }

  @override
  Future<String> deletePet(String petId) async {
    try {
      var url = Uri.parse('${baseUrl}pet?id=$petId');
      var response = await http.delete(url);
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        final msg = res['msg'];
        return msg;
      } else {
        throw PetException(res['msg']);
      }
    } catch (e) {
      throw PetException(e.toString());
    }
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
        final data = PetModel.fromMap(res['pet']);
        return data;
      } else {
        throw PetException(res['msg']);
      }
    } catch (e) {
      throw PetException(e.toString());
    }
  }

  @override
  Future<String> checkPet(dynamic imgFromUser, dynamic imgPet) async {
    try {
      var url = Uri.parse('${baseUrl}match');
      var request = http.MultipartRequest("GET", url);
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
      });
      request.files.add(http.MultipartFile.fromBytes(
          'img_from_user', imgFromUser,
          contentType: MediaType('application', 'json'), filename: "img.jpg"));
      request.fields['reference'] = imgPet;
      http.Response response =
          await http.Response.fromStream(await request.send());
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        final msg = res['SSIM'];
        return msg;
      } else {
        throw PetException(res['SSIM']);
      }
    } catch (e) {
      throw PetException(e.toString());
    }
  }

  // TODO: Implement reportPet in backend
  @override
  Future<ReportPetResponse> reportPet(ReportPetRequest reportRequest) async {
    try {
      var url = Uri.parse('${baseUrl}pet/match');
      var request = http.MultipartRequest("POST", url);
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
      });
      request.files.add(http.MultipartFile.fromBytes('img', reportRequest.img,
          contentType: MediaType('application', 'json'), filename: "img.jpg"));
      request.fields['id'] = reportRequest.petId;
      request.fields['name'] = reportRequest.name;
      request.fields['address'] = reportRequest.address;
      request.fields['details'] = reportRequest.details;

      http.Response response =
          await http.Response.fromStream(await request.send());
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        return res;
      } else {
        throw PetException(res['msg']);
      }
    } catch (e) {
      throw PetException(e.toString());
    }
  }
}
