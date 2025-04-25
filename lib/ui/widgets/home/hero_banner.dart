import 'package:flutter/material.dart';

class HeroBannerWidget extends StatefulWidget {
  const HeroBannerWidget({super.key});

  @override
  State<HeroBannerWidget> createState() => _HeroBannerWidgetState();
}

class _HeroBannerWidgetState extends State<HeroBannerWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> bannerData = [
    {
      'image':
          'https://m.media-amazon.com/images/M/MV5BMDI5ZGVmZTMtZTZkYy00ZDBmLWJlYTEtNzFjZWU0MGY2YTM0XkEyXkFqcGc@._V1_.jpg',
      'title': 'Movie Title 1',
    },
    {
      'image':
          'https://m.media-amazon.com/images/M/MV5BMDI5ZGVmZTMtZTZkYy00ZDBmLWJlYTEtNzFjZWU0MGY2YTM0XkEyXkFqcGc@._V1_.jpg',
      'title': 'Movie Title 2',
    },
    {
      'image':
          'https://m.media-amazon.com/images/M/MV5BMDI5ZGVmZTMtZTZkYy00ZDBmLWJlYTEtNzFjZWU0MGY2YTM0XkEyXkFqcGc@._V1_.jpg',
      'title': 'Movie Title 3',
    },
    {
      'image':
          'https://m.media-amazon.com/images/M/MV5BMDI5ZGVmZTMtZTZkYy00ZDBmLWJlYTEtNzFjZWU0MGY2YTM0XkEyXkFqcGc@._V1_.jpg',
      'title': 'Movie Title 4',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: _pageController,
            itemCount: bannerData.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final data = bannerData[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(data['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.black54, Colors.transparent],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        data['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              blurRadius: 4,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(bannerData.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentPage == index ? 10 : 6,
              height: _currentPage == index ? 10 : 6,
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.white : Colors.white38,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ],
    );
  }
}
