import 'package:flutter/material.dart';
import '../../../../../core/app_strings.dart';
import '../../../../../core/services/api_caller.dart';
import '../../../../../models/movie_model.dart';

class PopularMoviesProvider extends ChangeNotifier {

  bool _loading = false;
  bool get loading => _loading;

  List<MovieModel> _movies = [];
  List<MovieModel> get movies => _movies;

  Future<void> getPopularMovies() async {

    _loading = true;
    notifyListeners();

    final networkCaller = NetworkCaller(
      onUnauthorize: () {},
      headers: {
        "Authorization": "Bearer ${AppStrings.apiKey}",
        "Content-Type": "application/json"
      },
    );

    final response = await networkCaller.getRequest(
      url: "https://api.themoviedb.org/3/trending/tv/day",
    );

    if (response.isSuccess) {

      final List results = response.responseData['results'];

      _movies = results
          .map((movie) => MovieModel.fromJson(movie))
          .toList();

    }

    _loading = false;
    notifyListeners();
  }
}