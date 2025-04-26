import 'package:flutter/material.dart';
import 'package:prime_video_clone/data/model/movie_model.dart';
import 'package:prime_video_clone/data/services/movie_services.dart';
import 'package:prime_video_clone/common/details_page.dart'; // <-- Add this import

class WatchInYourLanguageSection extends StatefulWidget {
  const WatchInYourLanguageSection({super.key});

  @override
  _WatchInYourLanguageSectionState createState() =>
      _WatchInYourLanguageSectionState();
}

class _WatchInYourLanguageSectionState
    extends State<WatchInYourLanguageSection> {
  late Future<List<Movie>> futureMovies;

  @override
  void initState() {
    super.initState();
    futureMovies = MovieService().fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: futureMovies,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final movies = snapshot.data!;
          final languageMovies =
              [
                movies
                    .where((movie) => movie.language == 'Malayalam')
                    .firstOrNull,
                movies.where((movie) => movie.language == 'Hindi').firstOrNull,
                movies.where((movie) => movie.language == 'Tamil').firstOrNull,
                movies.where((movie) => movie.language == 'Telugu').firstOrNull,
              ].where((movie) => movie != null).cast<Movie>().toList();

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
                        'Watch in your language',
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
              _buildLanguageMovies(languageMovies),
            ],
          );
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }

  Widget _buildLanguageMovies(List<Movie> movies) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:
              movies.map((movie) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: InkWell(
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
                        width: 100,
                        height: 140,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Image.network(
                              movie.image,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              margin: const EdgeInsets.all(4),
                              child: Text(
                                movie.language,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
