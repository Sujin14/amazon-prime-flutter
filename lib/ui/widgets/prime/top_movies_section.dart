import 'package:flutter/material.dart';
import 'package:prime_video_clone/common/details_page.dart';
import 'dart:math';
import 'package:prime_video_clone/data/model/movie_model.dart';
import 'package:prime_video_clone/data/services/movie_services.dart';

class TopMoviesSection extends StatefulWidget {
  const TopMoviesSection({super.key});

  @override
  State<TopMoviesSection> createState() => _TopMoviesSectionState();
}

class _TopMoviesSectionState extends State<TopMoviesSection> {
  late Future<List<Movie>> futureTopMovies;

  @override
  void initState() {
    super.initState();
    futureTopMovies = _fetchRandomTopMovies();
  }

  Future<List<Movie>> _fetchRandomTopMovies() async {
    final movies = await MovieService().fetchMovies();
    movies.shuffle(Random());
    return movies.take(5).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: futureTopMovies,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No movies available'));
        }

        final topMovies = snapshot.data!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    child: Text(
                      'Top Movies',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 140,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                itemCount: topMovies.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final movie = topMovies[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailsPage(movie: movie),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        width: 150,
                        height: 80,
                        child: Image.network(
                          movie.image,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) => const Icon(
                                Icons.broken_image,
                                color: Colors.grey,
                              ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
