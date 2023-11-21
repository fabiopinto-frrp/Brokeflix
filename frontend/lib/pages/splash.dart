import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'assets/your_image.png', // Replace 'your_image.png' with your actual image asset path
          width: 200.0, // Adjust the width as needed
          height: 200.0, // Adjust the height as needed
        ),
      ),
    );
  }
}


