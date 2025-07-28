import 'package:ecommerce/details.dart';
import 'package:ecommerce/home.dart';
import 'package:ecommerce/search.dart';
import 'package:ecommerce/update.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: <String, WidgetBuilder> {
        '/home':(BuildContext context) => const Home(),
        '/details':(BuildContext context) => const Details(),
        '/update':(BuildContext context) => const Update(),
        '/search':(BuildContext context) => const Search(),
      },
      debugShowCheckedModeBanner: false,
      home: Update(),
    );
  }
}
