import 'package:flutter/material.dart';

import 'features/product/presentation/pages/details.dart';
import 'features/product/presentation/pages/home.dart';
import 'features/product/presentation/pages/search.dart';
import 'features/product/presentation/pages/update.dart';
import 'features/product/presentation/utils/animated_navigation.dart';
import 'injection_container.dart' as di;

void main() {
  di.init;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, WidgetBuilder> routes = {
      '/home': (BuildContext context) => Home(),
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
