import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/favorites_page/favorites_page.dart';
import 'pages/home_page/generator_page.dart';

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
  var favorites = <WordPair>[];

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var contextTheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const GeneratorPage();
        break;
      case 1:
        page = const FavoritesPage();
        break;
      case 2:
        page = const Placeholder(color: Color(0xFFFF4081));
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: contextTheme.inversePrimary,
            toolbarHeight: 25,
          ),
          body: Row(
            children: [
              SafeArea(
                  // Tells the app to respect the screen size
                  child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: const [
                  NavigationRailDestination(
                      // 0 index
                      icon: Icon(Icons.home),
                      label: Text("Home")),
                  NavigationRailDestination(
                      // 1 index
                      icon: Icon(Icons.favorite),
                      label: Text("Favorites")),
                  NavigationRailDestination(
                      // 2 index
                      icon: Icon(Icons.add_comment),
                      label: Text("Notes"))
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  // value is the index of destinations list
                  setState(() {
                    selectedIndex = value;
                  });
                },
              )),
              Expanded(
                  // expanded the max it can
                  child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ))
            ],
          ));
    });
  }
}
