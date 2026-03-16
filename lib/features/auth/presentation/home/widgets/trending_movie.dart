import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../main-navbar/screens/providers/trending_movies_provider.dart';
import 'movie_card.dart';

class TrendingMoviesSection extends StatelessWidget {
  const TrendingMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<TrendingMoviesProvider>(
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
    );
  }
}