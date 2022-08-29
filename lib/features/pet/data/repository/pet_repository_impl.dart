import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../../app/utils/base_url.dart';
import '../../domain/entities/pet.dart';
import '../../domain/entities/report.dart';
import '../../domain/exceptions/pet_exception.dart';
import '../../domain/repositories/pet_repository.dart';
import '../../domain/request/register_pet_request.dart';
import '../../domain/request/report_pet_request.dart';
import '../models/pet_model.dart';
import '../models/report_model.dart';

class PetRepositoryImpl extends IPetRepository {
  @override
  Future<List<Pet>> getPets() async {
    try {
      var url = Uri.parse('${baseUrl}pets/all');
      var response = await http.get(url);
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        final data = (res['pets'] as List).map((pet) => PetModel.fromMap(pet)).toList();
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
        final data = (res['pets'] as List).map((pet) => PetModel.fromMap(pet)).toList();
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

      request.files.add(await http.MultipartFile.fromPath(
        'img',
        petRequest.img,
        contentType: MediaType('image', 'jpeg'),
      ));
      request.fields['name'] = petRequest.name;
      request.fields['gender'] = petRequest.gender;
      request.fields['color'] = petRequest.color;
      request.fields['breed'] = petRequest.breed;
      request.fields['characteristics'] = petRequest.characteristics;
      request.fields['size'] = petRequest.size;
      request.fields['owner_id'] = petRequest.userId;
      request.fields['birthdate'] = petRequest.birthdate;

      http.Response response = await http.Response.fromStream(await request.send());
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
  Future<String> checkPet(dynamic imgFromUser) async {
    try {
      var url = Uri.parse('${baseUrl}breed');
      var request = http.MultipartRequest("POST", url);
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
      });
      request.files.add(await http.MultipartFile.fromPath(
        'pet_image',
        imgFromUser,
        contentType: MediaType('image', 'jpeg'),
      ));
      http.Response response = await http.Response.fromStream(await request.send());
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        final msg = res['raza'];
        return msg;
      } else {
        throw PetException(res['msg']);
      }
    } catch (e) {
      throw PetException(e.toString());
    }
  }

  @override
  Future<Report> reportPet(ReportPetRequest reportRequest) async {
    try {
      var url = Uri.parse('${baseUrl}report');
      var request = http.MultipartRequest("POST", url);
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
      });
      request.files.add(await http.MultipartFile.fromPath(
        'reported_img',
        reportRequest.reportedImg,
        contentType: MediaType('image', 'jpeg'),
      ));
      request.fields['pet_id'] = reportRequest.petId;
      request.fields['reporter_id'] = reportRequest.reporterId;
      request.fields['address'] = reportRequest.address;
      request.fields['description'] = reportRequest.details;

      http.Response response = await http.Response.fromStream(await request.send());
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        final data = ReportModel.fromMap(res['report']);
        return data;
      } else {
        throw PetException(res['msg']);
      }
    } catch (e) {
      throw PetException(e.toString());
    }
  }

  @override
  Future<List<Pet>> getReportedPetsByOwnerId(String ownerId) async {
    try {
      var url = Uri.parse('${baseUrl}report/pets?owner_id=$ownerId');
      var response = await http.get(url);
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        final data = (res['pets'] as List).map((pet) => PetModel.fromMap(pet)).toList();
        return data;
      } else {
        throw PetException(res['msg']);
      }
    } catch (e) {
      throw PetException(e.toString());
    }
  }

  @override
  Future<String> deleteReportedPet(String reportId) async {
    try {
      var url = Uri.parse('${baseUrl}report?id=$reportId');
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
  Future<Report> getReport(String petId) async {
    try {
      var url = Uri.parse('${baseUrl}report?pet_id=$petId');
      var response = await http.get(url);
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        final data = ReportModel.fromMap(res['report']);
        return data;
      } else {
        throw PetException(res['msg']);
      }
    } catch (e) {
      throw PetException(e.toString());
    }
  }
}
