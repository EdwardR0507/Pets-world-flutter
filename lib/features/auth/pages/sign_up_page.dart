import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pets_world/repositories/user/models/user_model.dart';
import 'package:pets_world/components/space.dart';
import 'package:pets_world/components/text_input.dart';
import 'package:pets_world/src/mixins/validation_mixins.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/sign-up';

  const SignUpPage({Key? key}) : super(key: key);
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

Future createUser(String name, String lastName, String dni, String address,
    int phone, String? token) async {
  try {
    var url = Uri.parse('http://localhost:3000/api/users');
    var response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: {
        'name': name,
        'lastName': lastName,
        'dni': dni,
        'address': address,
        'phone': phone
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return UserModel.fromJson(data);
    } else {
      throw Exception('Failed to load post');
    }
  } catch (e) {
    print(e);
  }
}

class _SignUpPageState extends State<SignUpPage> with ValidationMixins {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void signUpPage(String name, String lastName, String dni, String address,
      int phone) async {
    try {
      var url = '';
    } catch (e) {
      print(e);
    }
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState?.save();
          Navigator.pushNamed(context, "/sign-up-app");
        }
      },
      style: ElevatedButton.styleFrom(
          primary: const Color(0xFF6200EE),
          fixedSize: const Size(350, 36),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: const Text("SIGUIENTE"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
      addVerticalSpace(60),
      Image.asset("assets/images/logo.png"),
      addVerticalSpace(30),
      const Text("Regístrate",
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 40)),
      addVerticalSpace(30),
      const Text("Comencemos sabiendo quién eres.",
          style: TextStyle(fontSize: 16)),
      addVerticalSpace(30),
      Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
              key: _formKey,
              child: Column(children: [
                TextInput(
                    hintText: "Nombres",
                    validator: validateName,
                    onSaved: (value) {
                      print(value);
                    }),
                addVerticalSpace(30),
                TextInput(
                    hintText: "Apellidos",
                    validator: validateLastName,
                    onSaved: (value) {
                      print(value);
                    }),
                addVerticalSpace(30),
                TextInput(
                    hintText: "DNI",
                    validator: validateDNI,
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      print(value);
                    }),
                addVerticalSpace(30),
                TextInput(
                    hintText: "Dirección",
                    validator: validateAddress,
                    onSaved: (value) {
                      print(value);
                    }),
                addVerticalSpace(30),
                TextInput(
                    hintText: "Teléfono",
                    keyboardType: TextInputType.number,
                    validator: validatePhone,
                    onSaved: (value) {
                      print(value);
                    }),
                addVerticalSpace(30),
                _submitButton()
              ])))
    ]))));
  }
}
