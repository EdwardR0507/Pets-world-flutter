import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pets_world/src/widgets/space.dart';
import 'package:pets_world/src/widgets/submit_button.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color(0xFF1976D2),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/img_welcome.png", height: 300),
            const Text("Pets World",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 48,
                    color: Colors.white)),
            addVerticalSpace(20),
            const Padding(
                padding: EdgeInsets.only(left: 12, right: 12),
                child: Text(
                  "La mejor comunidad para cuidar a tus mascotas y todos los animalitos sin hogar.",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                )),
            addVerticalSpace(20),
            CustomSubmitButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/sign-up");
                },
                text: "REGÍSTRATE",
                width: 120),
            addVerticalSpace(15),
            const LinkText(),
          ],
        ),
      ),
    ));
  }
}

class LinkText extends StatelessWidget {
  const LinkText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        text: "o ",
        style: const TextStyle(fontSize: 16, color: Colors.white),
        children: [
          TextSpan(
              text: "Inicia sesión",
              style: const TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 16,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, "/login");
                })
        ]));
  }
}
