import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pets_world/features/auth/pages/sign_in_page.dart';
import 'package:pets_world/features/user/controllers/dashboard_controller.dart';
import 'package:pets_world/features/user/pages/pets/pets_page.dart';
import 'package:pets_world/features/user/pages/user_home.dart';
import 'package:pets_world/features/user/search/search_delegate.dart';
import 'package:pets_world/utils/custom_icons.dart';

class DashboardPage extends StatelessWidget {
  static const String routeName = "/";

  const DashboardPage({Key? key}) : super(key: key);

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
              () => Get.toNamed(DashboardPage.routeName)),
          about,
          getItem(const Icon(Icons.exit_to_app), "Cerrar Sesión", () {
            GetStorage().remove('token');
            Get.offAllNamed(SignInPage.routeName);
          })
        ],
      );
    }

    return Drawer(child: getList());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5F5F5),
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text("Mascotas Perdidas",
              style: TextStyle(color: Colors.black)),
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
        drawer: getDrawer(context),
        body: SafeArea(
          child: IndexedStack(
            index: controller.selectedIndex,
            children: const [
              UserHomePage(),
              PetsPage(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
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
          currentIndex: controller.selectedIndex,
          selectedItemColor: const Color(0xFF6200EE),
          onTap: controller.setSelectedIndex,
        ),
      );
    });
  }
}
