import 'package:flutter/material.dart';

class SubscriptionsSection extends StatelessWidget {
  const SubscriptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Repeating the same image for now
    final List<String> movieImages = List.generate(
      6,
      (_) =>
          'https://images.indianexpress.com/2025/03/Empuraan-Movie-Review-and-Rating-Mohanlal-Prithviraj-Sukumaran-2.jpg',
    );

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
          height: 140, // Adjusted to match image height
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            itemCount: movieImages.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 150,
                  height: 80,
                  child: Image.network(movieImages[index], fit: BoxFit.cover),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
