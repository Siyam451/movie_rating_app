import 'package:flutter/material.dart';
import '../../../../../common/widgets/buttom_navbar.dart';
import '../../../../../data/favourite_movies.dart';
import '../../../../../models/movie_model.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff0f1b2b),

      body: favoriteMovies.isEmpty
          ? const Center(
        child: Text(
          "No Favorite Movies Yet",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      )

          : ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: favoriteMovies.length,
        itemBuilder: (context, index) {

          final MovieModel movie = favoriteMovies[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 20),

            decoration: BoxDecoration(
              color: const Color(0xff1f2c3c),
              borderRadius: BorderRadius.circular(20),
            ),

            child: Row(
              children: [

                /// MOVIE IMAGE
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),

                  child: Image.network(
                    movie.image,
                    height: 110,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 15),

                /// MOVIE INFO
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12),

                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
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

                        Text(
                          movie.description,
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
                              style: const TextStyle(
                                color: Colors.white,
                              ),
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
      ),

      bottomNavigationBar: const BottomNavbar(selectedIndex: 2),
    );
  }
}