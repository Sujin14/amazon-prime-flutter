import 'package:flutter/material.dart';

class TopNavBarWidget extends StatelessWidget {
  const TopNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/logo.jpg', height: 50),
          Row(
            children: [
              Icon(Icons.cast, color: Colors.white),
              const SizedBox(width: 12),
              CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage('assets/images/logo.jpg'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
