import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'English Words App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

//State and Logic
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // watch the MyAppState
    var appState = context.watch<MyAppState>();
    var modifiedCurrentWord = appState.current;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(appState.current.asUpperCase),
      ),
      body: Column(children: [
        const Text("A random NICEEE idea:"),
        BigCard(modifiedCurrentWord: modifiedCurrentWord),
        ElevatedButton(
          onPressed: () {
            appState.getNext();
          },
          child: const Text("Next"),
        )
      ]),
    );
  }
}

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
        .copyWith(color: Color(0xFFE57373), fontWeight: FontWeight.w800);

    return Card(
      color: themeColor.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          modifiedCurrentWord.asUpperCase,
          style: styleApp,
        ),
      ),
    );
  }
}
