import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pets_world/features/user/data/models/pet_model.dart';
import 'package:pets_world/utils/base_url.dart';
import 'package:pets_world/utils/custom_snackbar.dart';

class PetRepository {
  Future<List<PetModel>> getPets() async {
    try {
      var url = Uri.parse('${baseUrl}pets');
      var response = await http.get(url);
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        final data =
            (res['pets'] as List).map((pet) => PetModel.fromMap(pet)).toList();
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

  Future<PetModel> getPet(id) async {
    try {
      var url = Uri.parse('${baseUrl}pet?id=$id');
      var response = await http.get(url);
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        final data = PetModel.fromMap(res['pet']);
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
}
