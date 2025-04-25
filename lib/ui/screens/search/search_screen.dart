import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> genres = [
      'Action and adventure',
      'Anime',
      'Comedy',
      'Documentary',
      'Drama',
      'Fantasy',
    ];

    final List<String> languages = [
      'English',
      'Hindi',
      'Tamil',
      'Malayalam',
      'Telugu',
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.white54),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Search by actor, title...',
                      style: TextStyle(color: Colors.white54, fontSize: 16),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.mic, color: Colors.white54),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            const Text(
              'Genres',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 2),
              childAspectRatio: 3,
              children:
                  genres.map((genre) {
                    return ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[850],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text(genre, textAlign: TextAlign.center),
                    );
                  }).toList(),
            ),

            const SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[850],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'See more',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
            const Text(
              'Featured collections',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 16),

            ...languages.map((lang) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  lang,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white54,
                  size: 16,
                ),
                onTap: () {},
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
