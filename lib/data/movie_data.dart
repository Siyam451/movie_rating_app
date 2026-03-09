import '../models/movie_model.dart';

List<MovieModel> movieList = [

  MovieModel(
    id: 1,
    title: "Robin Hood",
    overview: "Robin Hood steals from the rich and gives to the poor.",
    posterPath:
    "https://image.tmdb.org/t/p/w500/o0lO84GI7qrG6XFvtsPOSV7CTNa.jpg",
    backdropPath: "",
    rating: 8.2,
    releaseDate: "2010",

    director: "Ridley Scott",
    actors: [
      "Russell Crowe",
      "Cate Blanchett",
      "Max von Sydow"
    ],
    boxOffice: "\$321M",
  ),

  MovieModel(
    id: 2,
    title: "Avengers",
    overview: "Earth's mightiest heroes fight together.",
    posterPath:
    "https://image.tmdb.org/t/p/w500/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg",
    backdropPath: "",
    rating: 9.0,
    releaseDate: "2012",

    director: "Joss Whedon",
    actors: [
      "Robert Downey Jr.",
      "Chris Evans",
      "Scarlett Johansson"
    ],
    boxOffice: "\$1.5B",
  ),
];