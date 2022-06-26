import "package:flutter/material.dart";
import 'package:pets_world/components/space.dart';

class PetDetailsPage extends StatefulWidget {
  static const String routeName = '/pet';

  const PetDetailsPage({Key? key}) : super(key: key);
  @override
  _PetDetailsPageState createState() => _PetDetailsPageState();
}

class _PetDetailsPageState extends State<PetDetailsPage> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SizedBox(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage("assets/images/dog.png"),
                  ),
                ),
              ),
              Positioned(
                right: 0.0,
                bottom: 0.0,
                child: FloatingActionButton(
                  backgroundColor: const Color(0xff03dac6),
                  foregroundColor: Colors.black,
                  onPressed: () {},
                  child: const Icon(Icons.campaign),
                ),
              ),
            ],
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: const Text('Tribilín',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 40))),
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(25, 20, 0, 0),
                  child: const Icon(
                    Icons.person,
                    size: 35.0,
                  )),
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: const Text('Herminio Paucar',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 20))),
            ],
          ),
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(25, 20, 0, 0),
                  child: const Icon(
                    Icons.transgender,
                    size: 35.0,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                      child: const Text('Especie - Raza',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 20))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: const Text('Reportado el dd/mm/aaaa',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 15))),
                ],
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: const Divider(
              height: 20,
              thickness: 0.1,
              indent: 20,
              endIndent: 0,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
                  child: const Icon(
                    Icons.calendar_month,
                    size: 35.0,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: const Text('Nació el dd/mm/aa',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 20))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: const Text('3 años',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 15))),
                ],
              )
            ],
          ),
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(25, 20, 0, 0),
                  child: const Icon(
                    Icons.palette,
                    size: 35.0,
                  )),
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: const Text('Color',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 20))),
            ],
          ),
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(25, 20, 0, 0),
                  child: const Icon(
                    Icons.square_foot,
                    size: 35.0,
                  )),
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: const Text('Tamaño',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 20))),
            ],
          ),
          const Divider(
            height: 20,
            thickness: 0.1,
            indent: 20,
            endIndent: 0,
            color: Colors.black,
          ),
        ],
      )),
    );
  }
}
