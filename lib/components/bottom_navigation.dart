import 'package:flutter/material.dart';
import 'package:pets_world/utils/custom_icons.dart';

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
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(CustomIcons.soundDetectionDogbarking48px),
          label: "Mascotas Perdidas",
        ),
        BottomNavigationBarItem(
          icon: Icon(CustomIcons.pets),
          label: "Ver mascotas",
        ),
        BottomNavigationBarItem(
          icon: Icon(CustomIcons.village),
          label: "Mis refugios",
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color(0xFF6200EE),
      onTap: _onItemTapped,
    );
  }
}
