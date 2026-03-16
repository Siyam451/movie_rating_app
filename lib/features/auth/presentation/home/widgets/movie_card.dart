import 'package:flutter/material.dart';
import 'package:movieapp/features/auth/presentation/home/widgets/ratingdialog.dart';
import 'package:movieapp/features/auth/presentation/home/widgets/user_rating.dart';
import '../../../../../data/favourite_movies.dart';
import '../../../../../models/movie_model.dart';
import '../../details/details_screen.dart';

class MovieCard extends StatefulWidget {

  final MovieModel movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  double? userRating;



  void toggleFavorite() {

    if (favoriteMovies.contains(widget.movie)) {
      favoriteMovies.remove(widget.movie);
    } else {
      favoriteMovies.add(widget.movie);
    }
    loadFavorites();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MovieDetailsScreen(movie: widget.movie),
          ),
        );
      },

      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 15),

        child: Stack(
          children: [

            /// MOVIE IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                "https://image.tmdb.org/t/p/w500${widget.movie.posterPath}",
                height: 220,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),

            /// RATING
            Positioned(
              top: 10,
              left: 10,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => RatingDialog(
                      movieTitle: widget.movie.title,
                      onSubmit: (rating) {

                        setState(() {
                          userRatings[widget.movie.id] = rating;
                        });

                      },
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [

                      const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 16,
                      ),

                      const SizedBox(width: 4),

                      Text(
                        (userRatings[widget.movie.id] ?? widget.movie.rating).toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            /// FAVORITE BUTTON
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: toggleFavorite,
                child: Icon(
                  favoriteMovies.contains(widget.movie) // jdi ageh theke selected thake taile select kora jabe na
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}