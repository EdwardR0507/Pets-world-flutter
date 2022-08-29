import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/route_names.dart';
import '../domain/entities/pet.dart';

class PetsLostSearch extends SearchDelegate {
  PetsLostSearch({required this.petsLost})
      : super(
          searchFieldLabel: "Ingrese el nombre de la mascota",
          searchFieldStyle: const TextStyle(fontSize: 16),
        );

  final List<Pet> petsLost;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = petsLost
        .where((element) =>
            element.name.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              leading: SizedBox(
                height: 50,
                width: 50,
                child: Image.network(suggestionList[index].imgUrl,
                    fit: BoxFit.cover),
              ),
              title: Text(suggestionList[index].name),
              onTap: () => Get.toNamed(
                RouteNames.pet,
                arguments: {
                  'id': petsLost[index].id,
                },
              ),
            ),
            const Divider(),
          ],
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }
}
