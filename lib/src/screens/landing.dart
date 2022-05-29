import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pets_world/src/widgets/space.dart';

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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/signup");
              },
              style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF6200EE),
                  fixedSize: const Size(120, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text("REGISTRATE"),
            ),
            addVerticalSpace(15),
            Text.rich(TextSpan(
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
                ])),
          ],
        ),
      ),
    ));
  }
}
