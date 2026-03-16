import 'package:flutter/material.dart';
import 'package:movieapp/features/auth/presentation/home/widgets/latest_movie.dart';
import 'package:movieapp/features/auth/presentation/home/widgets/popular_movie.dart';
import 'package:movieapp/features/auth/presentation/home/widgets/top_bar_widget.dart';
import 'package:movieapp/features/auth/presentation/home/widgets/trending_movie.dart';
import 'package:movieapp/features/auth/presentation/home/widgets/tv_show.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/widgets/buttom_navbar.dart';
import '../home/widgets/category_chip.dart';


import '../main-navbar/screens/providers/trending_movies_provider.dart';
import '../home/providers/latest_movie_provider.dart';
import '../home/providers/popular_movie_provider.dart';
import '../home/providers/tv_show_provider.dart';

import '../starting/starting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;

  final List<String> categories = [
    "Popular",
    "Trending",
    "Movie",
    "TV Show"
  ];

  /// LOGOUT FUNCTION
  Future<void> logout(BuildContext context) async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.remove("isLoggedIn");

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const StartScreen(),
      ),
          (route) => false,
    );
  }

  /// LOGOUT DIALOG
  void showLogoutDialog() {

    showDialog(
      context: context,
      builder: (context) {

        return AlertDialog(

          title: const Text("Logout"),

          content: const Text(
              "Are you sure you want to logout?"
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                logout(context);
              },
              child: const Text("Logout"),
            )

          ],
        );
      },
    );
  }

  /// FETCH DATA
  @override
  void initState() {
    super.initState();

    Future.microtask(() {

      context.read<TrendingMoviesProvider>().getTrendingMovies();

      context.read<PopularMoviesProvider>().getPopularMovies();

      context.read<TvShowProvider>().getTVShow();

      context.read<LatestMoviesProvider>().getLatestMovies();

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xff0f1b2b),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Padding(

            padding: const EdgeInsets.symmetric(horizontal: 16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                const SizedBox(height: 10),

                /// TOP BAR
                HomeTopBar(
                  onLogout: showLogoutDialog,
                ),

                const SizedBox(height: 20),

                /// CATEGORY CHIPS
                SizedBox(
                  height: 40,

                  child: ListView.builder(

                    scrollDirection: Axis.horizontal,

                    itemCount: categories.length,

                    itemBuilder: (context, index) {

                      return GestureDetector(

                        onTap: () {

                          setState(() {
                            selectedIndex = index;
                          });

                        },

                        child: CategoryChip(
                          title: categories[index],
                          active: selectedIndex == index,
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 25),

                /// MOVIE SECTION
                SizedBox(
                  height: 220,

                  child: selectedIndex == 0
                      ? const PopularMoviesSection()

                      : selectedIndex == 1
                      ? const TrendingMoviesSection()

                      : selectedIndex == 2
                      ? const PopularMoviesSection()

                      : const TvShowSection(),
                ),

                const SizedBox(height: 25),

                /// LATEST TITLE
                const Text(
                  "Latest Releases",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                /// LATEST MOVIES LIST
                const LatestMoviesSection(),

              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: const BottomNavbar(selectedIndex: 0),
    );
  }
}