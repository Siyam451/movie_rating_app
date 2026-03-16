import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../details/details_screen.dart';
import '../providers/latest_movie_provider.dart';

class LatestMoviesSection extends StatelessWidget {
  const LatestMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<LatestMoviesProvider>(
      builder: (context, provider, child) {
        print(provider.movies.length);

        if (provider.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: provider.movies.length,
          itemBuilder: (context, index) {

            final movie = provider.movies[index];

            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx)=> MovieDetailsScreen(movie: movie),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 15),

                decoration: BoxDecoration(
                  color: const Color(0xff1f2c3c),
                  borderRadius: BorderRadius.circular(18),
                ),

                child: Row(
                  children: [

                    /// MOVIE IMAGE
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

                    /// MOVIE INFO
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            /// TITLE
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

                            /// RATING
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
              ),
            );
          },
        );
      },
    );
  }
}