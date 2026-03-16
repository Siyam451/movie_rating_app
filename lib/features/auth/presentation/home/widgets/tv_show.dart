import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tv_show_provider.dart';
import 'movie_card.dart';

class TvShowSection extends StatelessWidget {
  const TvShowSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<TvShowProvider>(
      builder: (context, provider, child) {

        if (provider.tvshowloading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (provider.shows.isEmpty) {
          return const Center(
            child: Text(
              "No TV Shows Found",
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: provider.shows.length,
          itemBuilder: (context, index) {

            final show = provider.shows[index];

            return MovieCard(movie: show);
          },
        );
      },
    );
  }
}