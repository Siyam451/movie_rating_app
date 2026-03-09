class MovieModel {

  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double rating;
  final String releaseDate;

  /// optional demo data
  final String? director;
  final List<String>? actors;
  final String? boxOffice;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.rating,
    required this.releaseDate,
    this.director,
    this.actors,
    this.boxOffice,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      overview: json['overview'] ?? "",
      posterPath: json['poster_path'] ?? "",
      backdropPath: json['backdrop_path'] ?? "",
      rating: (json['vote_average'] ?? 0).toDouble(),
      releaseDate: json['release_date'] ?? "",
    );
  }
}