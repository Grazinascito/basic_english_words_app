import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';


class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.modifiedCurrentWord,
  });

  final WordPair modifiedCurrentWord;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColor = theme.colorScheme;
    final styleApp = theme.textTheme.displayMedium!
        .copyWith(color: Colors.white, fontWeight: FontWeight.w800);
    final separetedWord =
        "${modifiedCurrentWord.first} ${modifiedCurrentWord.second}";
    return Card(
      color: themeColor.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(modifiedCurrentWord.asUpperCase,
            style: styleApp, semanticsLabel: separetedWord),
      ),
    );
  }
}