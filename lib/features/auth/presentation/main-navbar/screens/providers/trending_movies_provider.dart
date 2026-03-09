import 'package:flutter/material.dart';
import 'package:movieapp/models/movie_model.dart';

import '../../../../../../core/app_strings.dart';
import '../../../../../../core/services/api_caller.dart';

class TrendingMoviesProvider extends ChangeNotifier {

  bool _trendingScreenLoading = false;
  bool get trendingScreenLoading => _trendingScreenLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<MovieModel> _movies = [];
  List<MovieModel> get movies => _movies;

  Future<void> getTrendingMovies() async {

    _trendingScreenLoading = true;
    notifyListeners();

    final NetworkCaller networkCaller = NetworkCaller(
      onUnauthorize: () {},
      headers: {
        "Authorization": "Bearer ${AppStrings.apiKey}",
        "Content-Type": "application/json"
      },
    );

    final response = await networkCaller.getRequest(
      url: "https://api.themoviedb.org/3/trending/movie/day",
    );

    if (response.isSuccess) {

      final List results = response.responseData['results'];

      _movies = results
          .map((movie) => MovieModel.fromJson(movie))
          .toList();

      _errorMessage = null;

    } else {

      _errorMessage = response.errorMessage;
    }

    _trendingScreenLoading = false;
    notifyListeners();
  }
}