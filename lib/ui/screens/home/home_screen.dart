import 'package:flutter/material.dart';
import 'package:prime_video_clone/ui/widgets/home/category_buttons.dart';
import 'package:prime_video_clone/common/hero_banner.dart';
import 'package:prime_video_clone/ui/widgets/home/most_popular_shows.dart';
import 'package:prime_video_clone/ui/widgets/home/popular_movies_section.dart';
import 'package:prime_video_clone/ui/widgets/home/watch_in_your_language_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              CategoryButtonsWidget(),
              SizedBox(height: 16),
              HeroBannerWidget(),
              SizedBox(height: 16),
              PopularMoviesSection(),
              SizedBox(height: 16),
              WatchInYourLanguageSection(),
              SizedBox(height: 16),
              WatchForFreeMostPopularShowsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
