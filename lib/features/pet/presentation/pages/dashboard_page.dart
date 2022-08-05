import "package:flutter/material.dart";
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';

import '../../../../components/space.dart';
import '../../../../routes/route_names.dart';
import '../../../../utils/custom_icons.dart';
import '../../search/search_delegate.dart';
import '../controllers/dashboard_controller.dart';
import 'my_pets_page.dart';
import 'pets_page.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);

  void _logout() {
    final result = controller.logout();
    if (result) {
      Get.offAllNamed(RouteNames.signIn);
    }
  }

  Drawer _customDrawer() => Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: Svg('assets/images/logo.svg'),
              fit: BoxFit.contain,
            )),
            child: Container(),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () => Get.toNamed(RouteNames.dashboard),
          ),
          AboutListTile(
            key: const Key("about"),
            applicationIcon: const Icon(CustomIcons.pets),
            applicationName: "Pets World",
            applicationVersion: "1.0.0",
            aboutBoxChildren: [
              addVerticalSpace(20),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                      text:
                          "Pets World es una aplicación que permite a los usuarios "
                          "registrar y buscar mascotas perdidas.\n\n",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                ]),
              ),
            ],
            applicationLegalese: "\u{a9} All rights reserved",
            dense: true,
            icon: const Icon(Icons.info),
            child: const Text("Acerca de Pets World"),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Cerrar Sesión"),
            onTap: _logout,
          ),
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        iconTheme: const IconThemeData(color: Colors.black),
        title: Obx(() => Text(controller.title.value,
            style: const TextStyle(color: Colors.black))),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              showSearch(context: context, delegate: PetsLostSearch());
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff03dac6),
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              opaque: false,
              pageBuilder: (context, animation, secondaryAnimation) =>
                  FadeTransition(
                opacity: animation,
                child: const LateralMenu(),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      drawer: _customDrawer(),
      body: SafeArea(
        child: Obx(() => IndexedStack(
              index: controller.selectedIndex.value,
              children: const [
                PetsPage(),
                MyPetsPage(),
              ],
            )),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.soundDetectionDogbarking48px),
                label: "Mascotas Perdidas",
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.pets),
                label: "Mis mascotas",
              ),
            ],
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: const Color(0xFF6200EE),
            onTap: controller.setSelectedIndex,
          )),
    );
  }
}

class LateralMenu extends StatelessWidget {
  const LateralMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Material(
        color: Colors.black.withOpacity(0.1),
        child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 400),
          tween: Tween(begin: 1.0, end: 0.0),
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(200.0 * value, 0.0),
              child: child!,
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialButton(
                  onPressed: () {
                    Get.back();
                    Get.toNamed(RouteNames.registerPet);
                  },
                  child: const Text("Registrar Mascota")),
              addVerticalSpace(10),
              MaterialButton(
                  onPressed: () {
                    Get.back();
                    Get.toNamed(RouteNames.reportPet);
                  },
                  child: const Text("Reportar Mascota")),
              addVerticalSpace(130)
            ],
          ),
        ),
      ),
    );
  }
}
