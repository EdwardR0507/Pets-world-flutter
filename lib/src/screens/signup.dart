import 'package:flutter/material.dart';
import 'package:pets_world/src/widgets/space.dart';
import 'package:pets_world/src/widgets/text_input.dart';
import 'package:pets_world/src/mixins/validation_mixins.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with ValidationMixins {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState?.save();
          Navigator.pushNamed(context, "/signupapp");
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
            body: Column(children: [
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
    ])));
  }
}
