import 'package:flutter/material.dart';

class WatchInYourLanguageSection extends StatelessWidget {
  const WatchInYourLanguageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> languageMovies = [
      {
        'image':
            'https://images.indianexpress.com/2025/03/Empuraan-Movie-Review-and-Rating-Mohanlal-Prithviraj-Sukumaran-2.jpg',
        'language': 'Malayalam',
      },
      {
        'image':
            'https://images.indianexpress.com/2025/03/Empuraan-Movie-Review-and-Rating-Mohanlal-Prithviraj-Sukumaran-2.jpg',
        'language': 'Hindi',
      },
      {
        'image':
            'https://images.indianexpress.com/2025/03/Empuraan-Movie-Review-and-Rating-Mohanlal-Prithviraj-Sukumaran-2.jpg',
        'language': 'Tamil',
      },
      {
        'image':
            'https://images.indianexpress.com/2025/03/Empuraan-Movie-Review-and-Rating-Mohanlal-Prithviraj-Sukumaran-2.jpg',
        'language': 'Telugu',
      },
    ];

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
              SizedBox(width: 8),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 140, // Adjusted height to match the movie image
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            itemCount: languageMovies.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final item = languageMovies[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 100, // Set desired width
                  height: 140, // Set desired height
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Image.network(
                        item['image']!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Positioned(
                        left: 8,
                        bottom: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            item['language']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
