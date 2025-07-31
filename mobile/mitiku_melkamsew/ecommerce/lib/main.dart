import 'package:flutter/material.dart';

import 'data.dart';
import 'pages/details.dart';
import 'pages/home.dart';
import 'pages/search.dart';
import 'pages/update.dart';
import 'utils/animated_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ProductManager productManager = ProductManager();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, WidgetBuilder> routes = {
      '/home': (BuildContext context) => Home(productManager: productManager),
      '/details': (BuildContext context) => const Details(),
      '/update': (BuildContext context) => const Update(),
      '/search': (BuildContext context) => const Search(),
    };

    return MaterialApp(
      initialRoute: '/home',
      onGenerateRoute: (settings) {
        final builder = routes[settings.name];
        if (builder != null) {
          return createFadeRoute(builder(context), settings);
        }
        return null; 
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
