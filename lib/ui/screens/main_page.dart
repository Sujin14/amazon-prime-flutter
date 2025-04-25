import 'package:flutter/material.dart';
import 'package:prime_video_clone/ui/screens/downloads/downloads_screen.dart';
import 'package:prime_video_clone/ui/screens/home/home_screen.dart';
import 'package:prime_video_clone/ui/screens/prime/prime_page.dart';
import 'package:prime_video_clone/ui/screens/search/search_screen.dart';
import 'package:prime_video_clone/ui/screens/subscriptions/subscription_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    PrimeScreen(),
    SubscriptionScreen(),
    DownloadsScreen(),
    SearchScreen(),
  ];

  final List<String> _titles = [
    'Home',
    'Prime',
    'Subscription',
    'Downloads',
    'Search',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold, // Make the text bold
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.cast, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Container(
            width: 32,
            height: 32,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Colors.pink, Colors.deepPurple],
              ),
            ),
            child: const Icon(Icons.person, color: Colors.white, size: 20),
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.verified), label: 'Prime'),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Subscription',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Downloads',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),
    );
  }
}
