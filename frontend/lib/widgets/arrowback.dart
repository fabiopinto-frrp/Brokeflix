import 'package:flutter/material.dart';

class ArrowBackWidget extends StatelessWidget {
  const ArrowBackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: SizedBox(
        width: 24,
        height: 24,
        child: Stack(
          children: [
            Positioned(
              left: 4,
              top: 4,
              child: Image.asset(
                'assets/ArrowBack.png',
                width: 16,
                height: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
