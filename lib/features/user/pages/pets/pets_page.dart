import 'package:flutter/material.dart';
import 'package:pets_world/components/bottom_navigation.dart';
import 'package:pets_world/components/custom_card.dart';

class PetsPage extends StatefulWidget {
  static const String routeName = '/pets';

  const PetsPage({Key? key}) : super(key: key);

  @override
  _PetsPageState createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage> {
  int _selectedIndex = 2;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Mascotas perdidas',
      style: optionStyle,
    ),
    Text(
      'Index 1: Ver mascotas',
      style: optionStyle,
    ),
    Text(
      'Index 2: Mis refugios',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Drawer getDrawer(BuildContext context) {
    DrawerHeader header = const DrawerHeader(child: Text("Settings"));
    AboutListTile about = const AboutListTile(
        applicationIcon: Icon(Icons.favorite),
        icon: Icon(Icons.info),
        child: Text("Acerca de Pets World"));
    ListTile getItem(Icon icon, String descripcion, String route) {
      return ListTile(
          leading: icon,
          title: Text(descripcion),
          onTap: () {
            Navigator.pushNamed(context, route);
          });
    }

    ListView getList() {
      return ListView(
        children: [header, getItem(const Icon(Icons.home), "Home", "/"), about],
      );
    }

    return Drawer(child: getList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        leading: const Icon(Icons.menu),
        title:
            const Text('Mis refugios', style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              // openSearchPage(context);
            },
          ),
        ],
        backgroundColor: const Color(0xFFF5F5F5),
      ),
      drawer: getDrawer(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff03dac6),
        foregroundColor: Colors.black,
        onPressed: () {
          // Respond to button press
        },
        child: const Icon(Icons.add),
      ),
      body: SizedBox(
          child: Wrap(
        children: const [
          CustomCard(
              imagePath: "assets/images/dog.png",
              title: "Boby",
              description: "Registrado",
              route: "/"),
          CustomCard(
              imagePath: "assets/images/dog.png",
              title: "Rush",
              description: "Registrado",
              route: "/"),
          CustomCard(
              imagePath: "assets/images/dog.png",
              title: "Tribilín",
              description: "Registrado",
              route: "/"),
        ],
      )),
      bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
    );
  }
}
