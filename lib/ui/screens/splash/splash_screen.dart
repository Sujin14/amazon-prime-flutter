import 'dart:async';
import 'package:flutter/material.dart';
import 'package:prime_video_clone/ui/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      // TODO: Replace this with actual navigation
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.network(
          'https://img.asmedia.epimg.net/resizer/v2/67V32QCJUBGBDGARNEKSSC3DXY.jpg?auth=e8aea9ed34ace325a14493c87c7e36da405ceac6e0ab08127dff6e155b5fe576&width=644&height=362&smart=true',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
