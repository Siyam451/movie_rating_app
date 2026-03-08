import '../models/movie_model.dart';

List<MovieModel> movieList = [

  MovieModel(
    title: "Robin Hood",
    rating: 8.2,
    image:
    "https://image.tmdb.org/t/p/w500/o0lO84GI7qrG6XFvtsPOSV7CTNa.jpg",
    description:
    "Robin Hood is a legendary outlaw who steals from the rich and gives to the poor.",
    director: "Ridley Scott",
    actors: [
      "Russell Crowe",
      "Cate Blanchett",
      "Max von Sydow"
    ],
    boxOffice: "\$321M",
  ),

  MovieModel(
    title: "Avengers",
    rating: 9.0,
    image:
    "https://image.tmdb.org/t/p/w500/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg",
    description:
    "The Avengers are Earth's mightiest heroes assembled to fight threats beyond human ability.",
    director: "Joss Whedon",
    actors: [
      "Robert Downey Jr.",
      "Chris Evans",
      "Scarlett Johansson",
      "Chris Hemsworth"
    ],
    boxOffice: "\$1.5B",
  ),

];