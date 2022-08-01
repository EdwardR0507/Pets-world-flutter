import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../../../../components/space.dart';
import '../../../../routes/route_names.dart';
import '../../../../utils/custom_icons.dart';
import '../../search/search_delegate.dart';
import '../controllers/dashboard_controller.dart';
import 'pets_page.dart';
import 'my_pets_page.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);

  void _logout() {
    final result = controller.logout();
    if (result) {
      Get.offAllNamed(RouteNames.signIn);
    }
  }

  Drawer getDrawer(BuildContext context) {
    AboutListTile about = const AboutListTile(
        applicationIcon: Icon(Icons.favorite),
        icon: Icon(Icons.info),
        child: Text("Acerca de Pets World"));

    ListTile getItem(Icon icon, String title, void Function()? onTap) {
      return ListTile(leading: icon, title: Text(title), onTap: onTap);
    }

    ListView getList() {
      return ListView(
        children: [
          getItem(const Icon(Icons.home), "Home",
              () => Get.toNamed(RouteNames.dashboard)),
          about,
          getItem(const Icon(Icons.exit_to_app), "Cerrar Sesión", _logout),
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
      drawer: getDrawer(context),
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
                    Get.toNamed(RouteNames.registerPet);
                  },
                  child: const Text("Registrar Mascota")),
              addVerticalSpace(10),
              MaterialButton(
                  onPressed: () {
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
