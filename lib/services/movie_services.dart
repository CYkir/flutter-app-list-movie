import 'package:movie_app/models/Movie_model.dart';
import 'package:movie_app/core/api_client.dart';
import 'package:movie_app/res/movie_response.dart';

class MovieServices extends ApiClient {
  Future<List<MovieModel>> getMovies() async {
    try {
      print(" DEBUG GET MOVIES ");
      print("Request URL: ${dio.options.baseUrl}");

      final response = await dio.get('');

      print("Status Code: ${response.statusCode}");
      print("Response Data: ${response.data}");

      final result = MovieResponse.fromJson(response.data);

      print("Total movies: ${result.data.length}");

      return result.data;
    } catch (e) {
      print("ERROR GET MOVIES: $e");
      throw Exception('Gagal mengambil data movie: $e');
    }
  }

  Future<MovieModel> getMovieById(int id) async {
    try {
      print("=== DEBUG GET MOVIE BY ID ===");
      print("Request URL: ${dio.options.baseUrl}/$id");

      final response = await dio.get('/$id');

      print("Status Code: ${response.statusCode}");
      print("Response Data: ${response.data}");

      return MovieModel.fromJson(response.data['data']);
    } catch (e) {
      print("ERROR GET MOVIE BY ID: $e");
      throw Exception('Gagal mengambil detail movie: $e');
    }
  }
}
