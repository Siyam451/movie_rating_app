import 'package:flutter/material.dart';
import 'package:movieapp/features/auth/presentation/home/providers/latest_movie_provider.dart';
import 'package:movieapp/features/auth/presentation/home/providers/popular_movie_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/widgets/buttom_navbar.dart';

import '../home/widgets/category_chip.dart';
import '../home/widgets/movie_card.dart';

import '../main-navbar/screens/profile_screen.dart';
import '../main-navbar/screens/providers/trending_movies_provider.dart';
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

  Future<void> logout(BuildContext context) async {

    final prefs = await SharedPreferences.getInstance();

    // remove login status
    await prefs.setBool("isLoggedIn", false);
// i have used pushandremoveUntill because it will remove all the previous screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const StartScreen(),
      ),
          (route) => false,
    );
  }

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<TrendingMoviesProvider>().getTrendingMovies();
      context.read<PopularMoviesProvider>().getPopularMovies();
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
                Row(
                  children: [

                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ProfileScreen(),
                          ),
                        );
                      },
                      child: const CircleAvatar(
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

                   ///logout

                   IconButton(
                       style: IconButton.styleFrom(
                         backgroundColor: Colors.white
                       ),
                       onPressed: (){
                     logout(context);
                   }, icon: Icon(Icons.logout))
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

                /// MOVIE SECTION
                SizedBox(
                  height: 220,
                  child: selectedIndex == 0

                  /// POPULAR
                      ? Consumer<PopularMoviesProvider>(
                    builder: (context, provider, child) {

                      if (provider.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: provider.movies.length,
                        itemBuilder: (context, index) {

                          final movie = provider.movies[index];

                          return MovieCard(movie: movie);
                        },
                      );
                    },
                  )

                  /// TRENDING
                      : Consumer<TrendingMoviesProvider>(
                    builder: (context, provider, child) {

                      if (provider.trendingScreenLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: provider.movies.length,
                        itemBuilder: (context, index) {

                          final movie = provider.movies[index];

                          return MovieCard(movie: movie);
                        },
                      );
                    },
                  ),
                ),

                const SizedBox(height: 25),


                ///latest movie section
                const Text(
                  "Latest Releases",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),


                Consumer<LatestMoviesProvider>(
                  builder: (context, provider, child) {

                    if (provider.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: provider.movies.length,
                      itemBuilder: (context, index) {

                        final movie = provider.movies[index];

                        return Container(
                          margin: const EdgeInsets.only(bottom: 15),

                          decoration: BoxDecoration(
                            color: const Color(0xff1f2c3c),
                            borderRadius: BorderRadius.circular(18),
                          ),

                          child: Row(
                            children: [


                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  bottomLeft: Radius.circular(18),
                                ),

                                child: Image.network(
                                  "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                                  height: 120,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              const SizedBox(width: 12),


                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [


                                      Text(
                                        movie.title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(height: 6),

                                      /// DESCRIPTION
                                      Text(
                                        movie.overview,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 13,
                                        ),
                                      ),

                                      const SizedBox(height: 6),


                                      Row(
                                        children: [

                                          const Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                            size: 16,
                                          ),

                                          const SizedBox(width: 4),

                                          Text(
                                            movie.rating.toString(),
                                            style: const TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                )

              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: const BottomNavbar(selectedIndex: 0),
    );
  }
}