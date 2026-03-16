import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/movie_model.dart';

List<MovieModel> favoriteMovies = [];

/// SAVE FAVORITES
Future<void> saveFavorites() async {

  final prefs = await SharedPreferences.getInstance();

  List<String> movies =
  favoriteMovies.map((movie) => jsonEncode(movie.toJson())).toList();

  await prefs.setStringList("favorites", movies);
}

/// LOAD FAVORITES
Future<void> loadFavorites() async {

  final prefs = await SharedPreferences.getInstance();

  final List<String>? movies = prefs.getStringList("favorites");

  if (movies != null) {
    favoriteMovies =
        movies.map((e) => MovieModel.fromJson(jsonDecode(e))).toList();
  }
}