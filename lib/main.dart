import 'package:flutter/material.dart';
import 'features/auth/presentation/starting/starting_screen.dart';

void main() {
  runApp(const FilmrateApp());
}

class FilmrateApp extends StatelessWidget {
  const FilmrateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Filmrate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const StartScreen(),
    );
  }
}