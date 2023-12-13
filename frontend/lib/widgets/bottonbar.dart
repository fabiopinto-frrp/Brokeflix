import 'package:flutter/material.dart';

class BottonBar extends StatefulWidget {
  const BottonBar({super.key});

  @override
  BottonBarState createState() => BottonBarState();
}

class BottonBarState extends State<BottonBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 334,
      height: 74,
      padding: const EdgeInsets.all(22),
      decoration: ShapeDecoration(
        color: const Color(0xFF1C1C1C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/Home.png',
            width: 30,
            height: 30,
          ),
          Image.asset(
            'assets/WatchList.png',
            width: 30,
            height: 30,
          ),
          Image.asset(
            'assets/Profile.png',
            width: 30,
            height: 30,
          ),
        ],
      ),
    );
  }
}
