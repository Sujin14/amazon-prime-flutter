import 'package:flutter/material.dart';

class CategoryButtonsWidget extends StatelessWidget {
  const CategoryButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ["Movies", "TV shows", "Live TV"];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:
            categories
                .map(
                  (label) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white54),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        label,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
