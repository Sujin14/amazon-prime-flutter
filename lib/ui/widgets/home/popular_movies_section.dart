import 'package:flutter/material.dart';
import 'package:prime_video_clone/common/details_page.dart';
import 'package:prime_video_clone/data/model/movie_model.dart';

import 'dart:math';

import 'package:prime_video_clone/data/services/movie_services.dart';

class PopularMoviesSection extends StatelessWidget {
  const PopularMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieService movieService = MovieService();

    return FutureBuilder<List<Movie>>(
      future: movieService.fetchMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 140,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No movies found"));
        }

        final List<Movie> movies = List.from(snapshot.data!);
        movies.shuffle(Random());
        final randomMovies = movies.take(6).toList();

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
                      'Popular Movies - Free with ads',
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
                itemCount: randomMovies.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final movie = randomMovies[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MovieDetailsPage(movie: movie),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        width: 150,
                        height: 80,
                        child: Image.network(movie.image, fit: BoxFit.fill),
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
