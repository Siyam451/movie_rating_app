import 'package:flutter/material.dart';
import 'package:movieapp/core/app_strings.dart';
import 'package:movieapp/core/services/api_caller.dart';
import 'package:movieapp/models/movie_model.dart';

class LatestMoviesProvider extends ChangeNotifier {

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<MovieModel> _movies = [];
  List<MovieModel> get movies => _movies;

  Future<void> getLatestMovies() async {

    _loading = true;
    notifyListeners();

    final NetworkCaller networkCaller = NetworkCaller(
      onUnauthorize: () {},
      headers: {
        "Authorization": "Bearer ${AppStrings.apiKey}",
        "Content-Type": "application/json",
      },
    );

    final response = await networkCaller.getRequest(
      url: "https://api.themoviedb.org/3/movie/now_playing",
    );

    if (response.isSuccess) {

      List data = response.responseData['results'];

      _movies = data.map((e) => MovieModel.fromJson(e)).toList();

      _errorMessage = null;

    } else {
      _errorMessage = response.errorMessage;
    }

    _loading = false;
    notifyListeners();
  }
}