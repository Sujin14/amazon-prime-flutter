import 'package:flutter/material.dart';

class WatchForFreeMostPopularShowsSection extends StatelessWidget {
  const WatchForFreeMostPopularShowsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Repeating the same image for now, with show titles
    final List<Map<String, String>> showImages = [
      {
        'image':
            'https://images.indianexpress.com/2025/03/Empuraan-Movie-Review-and-Rating-Mohanlal-Prithviraj-Sukumaran-2.jpg',
        'show': 'Show 1',
      },
      {
        'image':
            'https://images.indianexpress.com/2025/03/Empuraan-Movie-Review-and-Rating-Mohanlal-Prithviraj-Sukumaran-2.jpg',
        'show': 'Show 2',
      },
      {
        'image':
            'https://images.indianexpress.com/2025/03/Empuraan-Movie-Review-and-Rating-Mohanlal-Prithviraj-Sukumaran-2.jpg',
        'show': 'Show 3',
      },
      {
        'image':
            'https://images.indianexpress.com/2025/03/Empuraan-Movie-Review-and-Rating-Mohanlal-Prithviraj-Sukumaran-2.jpg',
        'show': 'Show 4',
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
                  'Watch for free - Most Popular Shows',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 140, // Adjusted height to match the movie image
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            itemCount: showImages.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final item = showImages[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 100, // Set desired width
                  height: 140, // Set desired height
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.network(
                        item['image']!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'Latest Episodes',
                            style: TextStyle(
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
