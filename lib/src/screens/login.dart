import 'package:flutter/material.dart';
import "package:pets_world/src/mixins/validation_mixins.dart";
import 'package:pets_world/src/widgets/space.dart';
import 'package:pets_world/src/widgets/text_input.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with ValidationMixins {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState?.save();
          Navigator.pushNamed(context, "/");
        }
      },
      style: ElevatedButton.styleFrom(
          primary: const Color(0xFF6200EE),
          fixedSize: const Size(350, 36),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: const Text("INICIAR SESIÓN"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      addVerticalSpace(60),
      Image.asset("assets/images/logo.png"),
      addVerticalSpace(30),
      const Text("Inicia Sesión",
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 40),textAlign: TextAlign.center),
      addVerticalSpace(30),
      const Text("Un gusto volverte a ver por aquí.",
          style: TextStyle(fontSize: 16),textAlign: TextAlign.center),
      addVerticalSpace(30),
      Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
              key: _formKey,
              child: Column(children: [
                TextInput(
                    hintText: "Nombre de Usuario",
                    validator: validateUser,
                    onSaved: (value) {
                      print(value);
                    }),
                addVerticalSpace(30),
                TextInput(
                    hintText: "Contraseña",
                    obscureText: true,
                    validator: validatePassword,
                    onSaved: (value) {
                      print(value);
                    }),
                addVerticalSpace(30),
                _submitButton()
              ])))
    ]));
  }
}


