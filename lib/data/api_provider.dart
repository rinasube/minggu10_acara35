import 'dart:convert';
import "package:http/http.dart" show Client, Response;
import 'package:rest_api/model/popular_movie.dart';

class ApiProvider {
  String apiKey = '2694416bfddb750c430a2618830e62b3';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<Popularmovies> getPopularMovies() async {
    Uri url = Uri.parse('$baseUrl/movie/popular?api_key=$apiKey');
    Response response = await client.get(url);

    if (response.statusCode == 200) {
      return Popularmovies.fromjson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
