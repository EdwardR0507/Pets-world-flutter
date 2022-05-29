import 'package:flutter/material.dart';
import 'package:pets_world/src/widgets/space.dart';
import 'package:pets_world/src/widgets/text_input.dart';
import 'package:pets_world/src/mixins/validation_mixins.dart';

class SignUpApp extends StatefulWidget {
  const SignUpApp({Key? key}) : super(key: key);

  @override
  _SignUpAppState createState() => _SignUpAppState();
}

class _SignUpAppState extends State<SignUpApp> with ValidationMixins{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState?.save();
        }
        Navigator.pushNamed(context, "/");
      },
      style: ElevatedButton.styleFrom(
          primary: const Color(0xFF6200EE),
          fixedSize: const Size(350, 36),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: const Text("REGISTRARME"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      addVerticalSpace(60),
      Image.asset("assets/images/logo.png"),
      addVerticalSpace(30),
      const Text("Regístrate",
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 40)),
      addVerticalSpace(30),
      const Text("¡Genial!, ahora cuéntanos cómo te llamarás en PetsWorld.",
          style: TextStyle(fontSize: 16)),
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
                    hintText: "Correo Electrónico",
                    validator: validateEmail,
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
