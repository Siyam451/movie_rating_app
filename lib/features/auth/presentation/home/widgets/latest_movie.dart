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
                child: Text(movie.title),
              ),
            );
          },
        );
      },
    );
  }
}