import 'package:flutter/material.dart';
import '../../../../../models/movie_model.dart';
import '../../details/details_screen.dart';

class LatestCard extends StatelessWidget {

  final MovieModel movie;

  const LatestCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {

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
        margin: const EdgeInsets.only(right: 12),
        width: 120,
        child: Stack(
          children: [

            /// IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.image,
                height: 160,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),

            /// RATING BADGE
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [

                    const Icon(
                      Icons.star,
                      size: 14,
                      color: Colors.white,
                    ),

                    const SizedBox(width: 3),

                    Text(
                      movie.rating.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}