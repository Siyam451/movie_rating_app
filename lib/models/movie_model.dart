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

  // These two overrides are used so Dart can compare Movie objects
// based on their movie ID instead of their memory address.
// Without this, two MovieModel objects with the same movie data
// would still be considered different because they live in
// different memory locations.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
