import 'package:flutter/material.dart';
import 'package:frontend/pages/homePage.dart';

class ArrowBackWidget extends StatelessWidget {
  const ArrowBackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 20), // Add some padding at the top
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        child: Image.asset(
          'assets/ArrowBack.png',
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
