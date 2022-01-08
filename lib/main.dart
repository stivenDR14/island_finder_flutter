import 'package:flutter/material.dart';
import 'package:island_finder/pages/home.dart';
import 'package:island_finder/utils/general_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Island Solver',
      debugShowCheckedModeBanner: false,
      theme: generalTheme(),
      home: const Home(),
    );
  }
}

