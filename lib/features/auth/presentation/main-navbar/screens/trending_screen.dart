import 'package:flutter/material.dart';
import 'package:movieapp/features/auth/presentation/main-navbar/screens/providers/trending_movies_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../common/widgets/buttom_navbar.dart';
import '../../details/details_screen.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff0f1b2b),

      appBar: AppBar(
        title: const Text("Trending Movies"),
        backgroundColor: Colors.amber,
      ),

      body: Consumer<TrendingMoviesProvider>(
        builder: (context,trendingmovieprovider,_) {
          if (trendingmovieprovider.trendingScreenLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: trendingmovieprovider.movies.length,
            itemBuilder: (context, index) {

              final movie = trendingmovieprovider.movies[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MovieDetailsScreen(movie: movie),
                    ),
                  );
                },

                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),

                  child: Row(
                    children: [

                      /// MOVIE IMAGE
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                          height: 90,
                          width: 90,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(width: 15),

                      /// MOVIE INFO
                      Expanded(
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

                            const SizedBox(height: 5),

                            Text(
                              movie.overview,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white70,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              "⭐ ${movie.rating}",
                              style: const TextStyle(
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      ),

      bottomNavigationBar: const BottomNavbar(selectedIndex: 1),
    );
  }
}