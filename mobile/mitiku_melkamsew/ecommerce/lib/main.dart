import 'package:ecommerce/data.dart';
import 'package:ecommerce/pages/details.dart';
import 'package:ecommerce/pages/home.dart';
import 'package:ecommerce/pages/search.dart';
import 'package:ecommerce/pages/update.dart';
import 'package:ecommerce/utils/animated_navigation.dart';
import 'package:flutter/material.dart';

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
