import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  void setSelectedIndex(int index) {
    _selectedIndex = index;
    update();
  }
}
