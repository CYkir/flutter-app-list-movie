import 'package:flutter/material.dart';
import 'package:movie_app/models/Movie_model.dart';
import 'package:movie_app/utils/duration_extension.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetail extends StatefulWidget {
  final MovieModel movie;

  const MovieDetail({super.key, required this.movie});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

   String? extractedId = YoutubePlayer.convertUrlToId(widget.movie.trailerUrl);

    if (extractedId == null || extractedId.isEmpty) {
      debugPrint("Invalid YouTube URL: ${widget.movie.trailerUrl}");
    }

    _controller = YoutubePlayerController(
      initialVideoId: extractedId ?? '',
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    );

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.amberAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
            ),

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // POSTER
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      movie.poster,
                      width: 120,
                      height: 180,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 120,
                          height: 180,
                          color: Colors.grey[300],
                          child: const Icon(Icons.broken_image, size: 40),
                        );
                      },
                    ),
                  ),

                  const SizedBox(width: 12),

                  // INFO SAMPING POSTER
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          movie.genre,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              movie.rating.toString(),
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        Row(
                          children: [
                            const Icon(Icons.timer, size: 18),
                            const SizedBox(width: 4),
                            Text(
                              movie.duration.toDurationFormat(),
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        Text(
                          "Release Year: ${movie.releaseYear}",
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Divider(),

            // DESKRIPSI
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                movie.description,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.justify,
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
