import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/popular_movie_provider.dart';
import 'movie_card.dart';

class PopularMoviesSection extends StatelessWidget {
  const PopularMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<PopularMoviesProvider>(
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
    );
  }
}