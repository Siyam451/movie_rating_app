import 'package:flutter/material.dart';
import 'package:movieapp/features/auth/presentation/home/widgets/category_chip.dart';
import 'package:movieapp/features/auth/presentation/home/widgets/latest_card.dart';
import 'package:movieapp/features/auth/presentation/home/widgets/movie_card.dart';
import 'package:movieapp/features/auth/presentation/main-navbar/screens/profile_screen.dart';

import '../../../../common/widgets/buttom_navbar.dart';
import '../../../../data/latest_movie.dart';
import '../../../../data/movie_data.dart';

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
                Row(
                  children: [

                     GestureDetector(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (ctx)=> ProfileScreen()));
                       },
                       child: CircleAvatar(
                        radius: 22,
                        backgroundImage:
                        NetworkImage("https://i.pravatar.cc/150?img=3"),
                                           ),
                     ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Search on KuKu",
                            hintStyle: TextStyle(color: Colors.white60),
                            prefixIcon:
                            Icon(Icons.search, color: Colors.white60),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    const Icon(Icons.language, color: Colors.white),
                  ],
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

                /// FEATURED MOVIES
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movieList.length,
                    itemBuilder: (context, index) {

                      final movie = movieList[index];

                      return MovieCard(
                        movie: movie,
                      );
                    },
                  ),
                ),

                const SizedBox(height: 25),

                /// LATEST RELEASES TITLE
                const Text(
                  "Latest Releases",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                /// LATEST RELEASES LIST
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: latestMovies.length,
                    itemBuilder: (context, index) {

                      final movie = latestMovies[index];

                      return LatestCard(
                        movie: movie,
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),

      /// BOTTOM NAV BAR
      bottomNavigationBar: const BottomNavbar(selectedIndex: 0),
    );
  }
}