import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../routes/route_names.dart';
import '../../../../utils/base_url.dart';
import '../../../../utils/custom_snackbar.dart';
import '../../domain/repositories/pet_repository.dart';
import '../models/pet_model.dart';

class PetRepositoryImpl extends IPetRepository {
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
        customSnackbar('Error', res['msg'], CustomSnackbarType.error);
        throw Exception(res['msg']);
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load pets');
    }
  }

  Future<Pet> getPet(id) async {
    try {
      var url = Uri.parse('${baseUrl}pet?id=$id');
      var response = await http.get(url);
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        final data = Pet.fromMap(res['pet']);
        return data;
      } else {
        customSnackbar('Error', res['msg'], CustomSnackbarType.error);
        throw Exception(res['msg']);
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  @override
  Future<void> deletePet(String id) {
    // TODO: implement deletePet
    throw UnimplementedError();
  }

  @override
  Future<void> registerPet(Pet pet) async {
    try {
      var url = Uri.parse('${baseUrl}pet/register');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              "name": "Fido",
              "gender": "Macho",
              "color": "Marrón",
              "breed": "Pequines",
              "characteristics": "marrón pequeño",
              "size": "Pequeño",
              "owner_id": "62b7b8c227f461a009d66523",
              "birthdate": "25-06-2020"
            },
          ));
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        Get.offAllNamed(RouteNames.dashboard);
        customSnackbar(
            'Registro exitoso',
            'Se ha registrado el perro correctamente',
            CustomSnackbarType.success);
      } else {
        customSnackbar('Error', res['msg'], CustomSnackbarType.error);
      }
    } catch (e) {
      print(e);
    }
  }
}
