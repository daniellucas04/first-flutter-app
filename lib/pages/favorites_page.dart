import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/myapp_state.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favoriteList = appState.favorites;

    if (favoriteList.isEmpty) {
      return Center(
        child: Text(
          "No favorites yet.",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text("You have ${favoriteList.length} favorites"),
        ),
        for (WordPair i in favoriteList)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(i.asLowerCase),
          ),
      ],
    );
  }
}
