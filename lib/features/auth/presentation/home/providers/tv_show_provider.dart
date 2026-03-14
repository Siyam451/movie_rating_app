import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movieapp/core/services/api_caller.dart';

import '../../../../../core/app_strings.dart';
import '../../../../../models/movie_model.dart';

class TvShowProvider extends ChangeNotifier{
  bool _tvshowloading = false;
  bool get tvshowloading => _tvshowloading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<MovieModel> _shows = [];
  List<MovieModel> get shows => _shows;

  Future<void> getTVShow()async{
    _tvshowloading = true;
    notifyListeners();

    final NetworkCaller networkCaller = NetworkCaller(
      onUnauthorize: (){},
      headers: {
        "Authorization": "Bearer ${AppStrings.apiKey}",
        "Content-Type": "application/json"
      },
    );
    final response = await networkCaller.getRequest(
      url: "https://api.themoviedb.org/3/tv/top_rated",
    );

    if(response.isSuccess){
      List data = response.responseData['result'];
      _shows = data.map((e) {

        return MovieModel(
          id: e['id'] ?? 0,
          title: e['name'] ?? "",
          overview: e['overview'] ?? "",
          posterPath: e['poster_path'] ?? "",
          backdropPath: e['backdrop_path'] ?? "",
          rating: (e['vote_average'] ?? 0).toDouble(),
          releaseDate: e['first_air_date'] ?? "",
        );

      }).toList();
      _errorMessage = null;
    }else{
      _errorMessage = response.errorMessage;
    }
    _tvshowloading = false;
    notifyListeners();
  }


}