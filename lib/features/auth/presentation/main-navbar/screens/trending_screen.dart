import 'package:flutter/material.dart';
import '../../../../../common/widgets/buttom_navbar.dart';
import '../../../../../data/movie_data.dart';
import '../../details/details_screen.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff0f1b2b),
      appBar: AppBar(title: Text('Trending Movies',),
      backgroundColor: Colors.amber,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 10),

              /// HEADER
              Row(
                children: [

                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),

                  const SizedBox(width: 10),

                  const Text(
                    "Top 10 Trending",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// MOVIE LIST
              Expanded(
                child: ListView.builder(
                  itemCount: movieList.length,
                  itemBuilder: (context, index) {

                    final movie = movieList[index];

                    return GestureDetector(

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                MovieDetailsScreen(movie: movie),
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
                                movie.image,
                                height: 90,
                                width: 90,
                                fit: BoxFit.cover,
                              ),
                            ),

                            const SizedBox(width: 15),

                            /// MOVIE INFO
                            Expanded(
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

                                  const SizedBox(height: 5),

                                  Text(
                                    movie.description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13,
                                    ),
                                  ),

                                  const SizedBox(height: 5),

                                  Text(
                                    "⭐ ${movie.rating}",
                                    style: const TextStyle(
                                      color: Colors.orange,
                                      fontSize: 12,
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
                ),
              ),
            ],
          ),
        ),
      ),

      /// BOTTOM NAVIGATION
      bottomNavigationBar: const BottomNavbar(selectedIndex: 1),
    );
  }
}