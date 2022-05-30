import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int _selectedIndex;
  final ValueChanged<int> _onItemTapped;
  const CustomBottomNavigationBar({
    Key? key,
    required int selectedIndex,
    required ValueChanged<int> onItemTapped,
  })  : _selectedIndex = selectedIndex,
        _onItemTapped = onItemTapped,
        super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
