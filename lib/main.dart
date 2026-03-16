import 'package:flutter/material.dart';
import 'package:movieapp/features/auth/presentation/home/providers/latest_movie_provider.dart';
import 'package:movieapp/features/auth/presentation/home/providers/tv_show_provider.dart';
import 'package:movieapp/features/auth/presentation/main-navbar/screens/providers/trending_movies_provider.dart';
import 'package:provider/provider.dart';

import 'core/services/authcontroller.dart';
import 'data/favourite_movies.dart';
import 'features/auth/presentation/home/home_screen.dart';
import 'features/auth/presentation/home/providers/popular_movie_provider.dart';
import 'features/auth/presentation/starting/starting_screen.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await AuthController.getUserData();
  await loadFavorites();

  bool isLoggedIn = await AuthController.isUserLoggedIn();

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {

  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (_) => TrendingMoviesProvider()),
        ChangeNotifierProvider(create: (_) => PopularMoviesProvider()),
        ChangeNotifierProvider(create: (_) => TvShowProvider()),
        ChangeNotifierProvider(create: (_) => LatestMoviesProvider()),

      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isLoggedIn ? HomeScreen() : StartScreen(),
      ),
    );
  }
}