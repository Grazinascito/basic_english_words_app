import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var contextTheme = Theme.of(context).colorScheme;
    var favoriteList = appState.favorites;

    return Column(
      children: [
        Text(
          "My favorites",
          style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: contextTheme.primary),
        ),
        SingleChildScrollView(
          child: SizedBox(
            height: 700,
            child: ListView.builder(
              itemCount: favoriteList.length,
              itemBuilder: (context, int index) {
                return Card(
                  color: contextTheme.primary,
                  child: ListTile(
                      leading: const Icon(Icons.favorite, color: Colors.white),
                      title: Text(
                        favoriteList[index].toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
