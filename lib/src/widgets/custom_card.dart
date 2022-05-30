import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String route;
  const CustomCard(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.description,
      required this.route})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(20),
      clipBehavior: Clip.antiAlias,
      child: Column(children: [
        //Image.asset("assets/images/dog.png"),
        Image.asset(imagePath),
        ListTile(
          title: Text(title, style: const TextStyle(fontSize: 20)),
          subtitle: Text(
            description,
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pushNamed(context, route);
          },
        ),
      ]),
    );
  }
}
