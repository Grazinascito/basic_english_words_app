
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/big_card.dart';
import '../../main.dart';

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    // watch MyAppState
    var appState = context.watch<MyAppState>();
    var contextTheme = Theme.of(context).colorScheme;

    var modifiedCurrentWord = appState.current;

    var containsFavoriteWord = appState.favorites.contains(modifiedCurrentWord);
    var selectedIcon =
        containsFavoriteWord ? Icons.favorite : Icons.favorite_border;

    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "A random NICEEE idea:",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: contextTheme.primary),
        ),
        const SizedBox(height: 20),
        BigCard(modifiedCurrentWord: modifiedCurrentWord),
        const SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton.icon(
            onPressed: () {
              appState.toggleFavorite();
            },
            label: const Text("Like"),
            icon: Icon(selectedIcon),
          ),
          const SizedBox(
            width: 50,
          ),
          ElevatedButton(
            onPressed: () {
              appState.getNext();
            },
            child: const Text("Next"),
          ),
        ]),
      ]),
    );
  }
}

