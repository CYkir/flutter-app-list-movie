class MovieModel {
  final int id;
  final String title;
  final String description;
  final String genre;
  final int duration;
  final int releaseYear;
  final double rating;
  final String poster;
  final String trailerUrl;
  final String createdAt;
  final String updatedAt;

  MovieModel({
    required this.id,
    required this.title,
    required this.description,
    required this.genre,
    required this.duration,
    required this.releaseYear,
    required this.rating,
    required this.poster,
    required this.trailerUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: int.parse(json['id'].toString()),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      genre: json['genre'] ?? '',
      duration: int.parse(json['duration'].toString()),
      releaseYear: int.parse(json['release_year'].toString()),
      rating: double.parse(json['rating'].toString()),
      poster: json['poster'] ?? '',
      trailerUrl: json['trailer_url'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "genre": genre,
      "duration": duration,
      "release_year": releaseYear,
      "rating": rating,
      "poster": poster,
      "trailer_url": trailerUrl,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}
