import 'package:flutter/material.dart';

class PetsLostSearch extends SearchDelegate {
  String selection = "";

  final petsLost = [
    "Pluto",
    "Felix",
    "Lucas",
  ];

  final recentPetsLost = [
    "Pluto",
    "Felix",
  ];

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
  Widget buildResults(BuildContext context) {
    // Show results based on the search
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(selection),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionsList = query.isEmpty
         ? recentPetsLost
         : petsLost
             .where((p) => p.toLowerCase().contains(query.toLowerCase()))
             .toList();

     return ListView.builder(
       itemCount: suggestionsList.length,
       itemBuilder: (context, index) {
         return ListTile(
           leading: const Icon(Icons.all_inbox),
           title: Text(suggestionsList[index]),
           onTap: () {
             selection = petsLost[index];
             showResults(context);
           },
         );
       },
     );
  }
}