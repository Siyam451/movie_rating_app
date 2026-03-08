class MovieModel {
  final String title;
  final String image;
  final double rating;
  final String description;

  final String director;
  final List<String> actors;
  final String boxOffice;

  MovieModel({
    required this.title,
    required this.image,
    required this.rating,
    required this.description,
    required this.director,
    required this.actors,
    required this.boxOffice,
  });
}