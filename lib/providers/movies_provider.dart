
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';


class MoviesProvider extends ChangeNotifier {

  String _apiKey   = '36c66b8cb25a6c605c4d6804ce27f452';
  String _baseUrl  = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies   = [];
  int _popularPage = 0;

  MoviesProvider() {
    print('MoviesProvider inicializado');

    this.getOnDisplayMovies();
    this.getPopularMovies();

  }

  Future<String> _getJsonData( String endpoint, [int page = 1] ) async {
    final url = Uri.https( _baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page'
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }


  getOnDisplayMovies() async {
    
    final jsonData = await this._getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    
    onDisplayMovies = nowPlayingResponse.results;
    
    notifyListeners();
  }

  getPopularMovies() async {

    _popularPage++;

    final jsonData = await this._getJsonData('3/movie/popular', _popularPage );
    final popularResponse = PopularResponse.fromJson( jsonData );
    
    popularMovies = [ ...popularMovies, ...popularResponse.results ];
    notifyListeners();
  }
}