import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _baseURL = 'api.themoviedb.org';
  String _apiKey = '36c66b8cb25a6c605c4d6804ce27f452';
  String _lang = 'es-ES';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    print('MoviesProvider inicializado');
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseURL, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _lang, 'page': '1'});
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    // print(nowPlayingResponse.results[0].title);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners(); //notifica a los widgets q se redibujen cuando hay cambios
  }
}
