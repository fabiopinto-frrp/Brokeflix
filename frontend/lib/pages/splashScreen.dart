import 'package:flutter/material.dart';
import 'dart:async';
import '../services/checkLogin.dart';
import 'loginPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration:
          const Duration(seconds: 2), // Shortened duration for faster animation
    );

    _fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Cubic(0.3, 0.0, 0.7, 1.0),
      ),
    );

    Timer(
      const Duration(seconds: 1), // Shortened delay for faster animation
      () {
        _animationController.forward();

        _animationController.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return FadeTransition(
                    opacity: animation,
                    child:
                        LoginPage(), // Replace with your actual login page widget
                  );
                },
                transitionDuration: const Duration(
                    seconds: 1), // Shortened duration for faster animation
              ),
            );
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Image.asset(
            'assets/BrokeFlix.png',
            width: 200.0,
            height: 200.0,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
