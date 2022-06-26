import 'package:flutter/material.dart';
import 'package:pets_world/components/space.dart';
import 'package:pets_world/components/submit_button.dart';
import 'package:pets_world/components/text_input.dart';
import 'package:pets_world/src/mixins/validation_mixins.dart';

class SignUpAppPage extends StatefulWidget {
  static const String routeName = '/sign-up-app';

  const SignUpAppPage({Key? key}) : super(key: key);

  @override
  _SignUpAppPageState createState() => _SignUpAppPageState();
}

class _SignUpAppPageState extends State<SignUpAppPage> with ValidationMixins {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onSignUpAppPage() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
    }
    Navigator.pushNamed(context, "/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      addVerticalSpace(60),
      Image.asset("assets/images/logo.png"),
      addVerticalSpace(30),
      const Text("Regístrate",
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 40),
          textAlign: TextAlign.center),
      addVerticalSpace(30),
      const Text(
        "¡Genial!, ahora cuéntanos cómo te llamarás en PetsWorld.",
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
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
                CustomSubmitButton(
                    onPressed: _onSignUpAppPage, text: "REGISTRARME")
              ])))
    ])));
  }
}
