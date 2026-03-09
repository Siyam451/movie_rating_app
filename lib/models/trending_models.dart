class TrendingMovieModel {

  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;
  final double popularity;
  final bool adult;
  final String originalLanguage;
  final List<int> genreIds;

  TrendingMovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
  });

  factory TrendingMovieModel.fromJson(Map<String, dynamic> json) {

    return TrendingMovieModel(
      id: json['id'],
      title: json['title'] ?? "",
      overview: json['overview'] ?? "",
      posterPath: json['poster_path'] ?? "",
      backdropPath: json['backdrop_path'] ?? "",
      releaseDate: json['release_date'] ?? "",
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      popularity: (json['popularity'] ?? 0).toDouble(),
      adult: json['adult'] ?? false,
      originalLanguage: json['original_language'] ?? "",
      genreIds: List<int>.from(json['genre_ids'] ?? []),
    );
  }

}