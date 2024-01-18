import 'package:flutter/material.dart';
import '../pages/watchListPage.dart';
import '../pages/homePage.dart';
import '../pages/profilePage.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  BottomBarState createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
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
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: Image.asset(
              'assets/Home.png',
              width: 30,
              height: 30,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const WatchListPage()),
              );
            },
            child: Image.asset(
              'assets/WatchList.png',
              width: 30,
              height: 30,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            child: Image.asset(
              'assets/Profile.png',
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}
