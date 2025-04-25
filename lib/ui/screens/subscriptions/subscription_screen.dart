import 'package:flutter/material.dart';
import 'package:prime_video_clone/ui/widgets/subscriptions/hero_banner.dart';
import 'package:prime_video_clone/ui/widgets/subscriptions/most_popular.dart';
import 'package:prime_video_clone/ui/widgets/subscriptions/subscriptions_section.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              HeroBannerWidget(),
              SizedBox(height: 16),
              Discovery(),
              SizedBox(height: 16),
              SubscriptionsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
