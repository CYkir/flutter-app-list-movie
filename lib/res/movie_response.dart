

import 'package:movie_app/models/Movie_model.dart';

class MovieResponse {
  final bool status;
  final String message;
  final List<MovieModel> data;

  MovieResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List)
          .map((item) => MovieModel.fromJson(item))
          .toList(),
    );
  }
}
