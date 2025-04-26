import 'package:flutter/material.dart';
import 'package:prime_video_clone/common/details_page.dart';
import 'package:prime_video_clone/data/model/movie_model.dart';
import 'package:prime_video_clone/data/services/movie_services.dart';

class SubscriptionsSection extends StatefulWidget {
  const SubscriptionsSection({super.key});

  @override
  State<SubscriptionsSection> createState() => _SubscriptionsSectionState();
}

class _SubscriptionsSectionState extends State<SubscriptionsSection> {
  final MovieService _movieService = MovieService();
  late Future<List<Movie>> _futureMovies;

  @override
  void initState() {
    super.initState();
    _futureMovies = _fetchRandomMovies();
  }

  Future<List<Movie>> _fetchRandomMovies() async {
    final movies = await _movieService.fetchMovies();
    movies.shuffle(); // Shuffle the list to get random movies
    return movies.take(6).toList(); // Limit to 6 items
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: _futureMovies,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 140,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No subscription content"));
        }

        final movies = snapshot.data!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                itemCount: movies.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return InkWell(
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => MovieDetailsPage(movie: movie),
                          ),
                        ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        width: 150,
                        height: 80,
                        child: Image.network(movie.image, fit: BoxFit.cover),
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
