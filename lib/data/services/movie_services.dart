import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prime_video_clone/data/model/movie_model.dart';

class MovieService {
  final String _baseUrl =
      'https://run.mocky.io/v3/6cd99b78-1b28-462e-a902-e73693926a80';

  Future<List<Movie>> fetchMovies() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> movieList = data['movies'];
        return movieList.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      rethrow;
    }
  }
}
