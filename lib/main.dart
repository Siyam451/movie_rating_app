import 'package:flutter/material.dart';
import 'package:movieapp/features/auth/presentation/main-navbar/screens/providers/trending_movies_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/auth/presentation/home/home_screen.dart';
import 'features/auth/presentation/starting/starting_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {

  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> TrendingMoviesProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isLoggedIn ?  HomeScreen() :  StartScreen(),
      ),
    );
  }
}