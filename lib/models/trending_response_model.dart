import 'package:movieapp/models/trending_models.dart';


class TrendingResponseModel {

  final int page;
  final List<TrendingMovieModel> results;
  final int totalPages;
  final int totalResults;

  TrendingResponseModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TrendingResponseModel.fromJson(Map<String, dynamic> json) {

    return TrendingResponseModel(
      page: json['page'],

      results: (json['results'] as List)
          .map((movie) => TrendingMovieModel.fromJson(movie))
          .toList(),

      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

}