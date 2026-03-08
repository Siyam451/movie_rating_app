import '../models/movie_model.dart';

List<MovieModel> latestMovies = [

  MovieModel(
    title: "New Release 1",
    rating: 7.8,
    image:
    "https://images.unsplash.com/photo-1507874457470-272b3c8d8ee2",
    description:
    "A new blockbuster movie full of action and adventure.",
    director: "James Cameron",
    actors: [
      "Sam Worthington",
      "Zoe Saldana"
    ],
    boxOffice: "\$2.9B",
  ),

  MovieModel(
    title: "New Release 2",
    rating: 8.5,
    image:
    "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4",
    description:
    "A thrilling story with suspense and drama.",
    director: "Christopher Nolan",
    actors: [
      "Leonardo DiCaprio",
      "Joseph Gordon-Levitt"
    ],
    boxOffice: "\$836M",
  ),

];