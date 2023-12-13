import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  TopBarState createState() => TopBarState();
}

class TopBarState extends State<TopBar> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 402,
      height: 114,
      padding: const EdgeInsets.only(
        top: 70,
        left: 35,
        right: 35,
        bottom: 20,
      ),
      decoration: const BoxDecoration(color: Color(0xFF1C1C1C)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                  ),
                ),
              ],
            ),
          ),
          const Text(
            'Movies',
            style: TextStyle(
              color: Color(0xFFFA3D3B),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          const Text(
            'Series',
            style: TextStyle(
              color: Color(0xFFFA3D3B),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          const Text(
            'Anime',
            style: TextStyle(
              color: Color(0xFFFA3D3B),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
