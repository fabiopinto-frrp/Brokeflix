import 'package:flutter/material.dart';
import 'dart:async';
import '../services/checkLogin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLoggedUser(context);

    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, '/login');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'assets/BrokeFlix.png',
          width: 200.0,
          height: 200.0,
        ),
      ),
    );
  }
}
