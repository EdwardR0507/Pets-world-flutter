import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;
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
      'Index 2: Mis Refugios',
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
        children: [
          header,
          getItem(const Icon(Icons.home), "Home", "/"),
          about
        ],
      );
    }

    return Drawer(child: getList());
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Mascotas Perdidas", style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              // openSearchPage(context);
            },
          ),
        ],
      ),
      drawer: getDrawer(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff03dac6),
        foregroundColor: Colors.black,
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
      body: SizedBox(child: Wrap(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.all(20),
            clipBehavior: Clip.antiAlias,
            child: Column(children: [
              Image.asset("assets/images/dog.png"),
              ListTile(
                title: const Text("Perro", style:TextStyle(fontSize: 20)),
                subtitle: Text("Perro perdido", style: TextStyle(color: Colors.black.withOpacity(0.6)),),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.pushNamed(context, "/lostdog");
                },
              ),
            ]),
          )
        ],
      )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Mascotas Perdidas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Ver mascotas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Mis refugios",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF6200EE),
        onTap: _onItemTapped,
      ),

      

    );
  }
}
