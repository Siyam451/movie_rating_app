import '../models/movie_model.dart';

List<MovieModel> latestMovies = [

  MovieModel(
    id: 101,
    title: "New Release 1",
    overview: "A new blockbuster movie full of action and adventure.",
    posterPath:
    "https://images.unsplash.com/photo-1507874457470-272b3c8d8ee2",
    backdropPath: "",
    rating: 7.8,
    releaseDate: "2024",

    director: "James Cameron",
    actors: [
      "Sam Worthington",
      "Zoe Saldana"
    ],
    boxOffice: "\$2.9B",
  ),

  MovieModel(
    id: 102,
    title: "New Release 2",
    overview: "A thrilling story with suspense and drama.",
    posterPath:
    "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4",
    backdropPath: "",
    rating: 8.5,
    releaseDate: "2024",

    director: "Christopher Nolan",
    actors: [
      "Leonardo DiCaprio",
      "Joseph Gordon-Levitt"
    ],
    boxOffice: "\$836M",
  ),

];