import 'package:flutter/material.dart';

class WatchlistCard extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String numberOfEpisodes;
  final String progress;
  final String score;

  const WatchlistCard(
<<<<<<< HEAD
      {required this.imageUrl, required this.name, required this.episodes, required String score});
=======
      {required this.imageUrl,
      required this.name,
      required this.numberOfEpisodes,
      required this.progress,
      required this.score});
>>>>>>> 00abfc72b22c1bdc204d94e144677cca113940ad

  @override
  WatchlistCardState createState() => WatchlistCardState();
}

class WatchlistCardState extends State<WatchlistCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 334,
      height: 108,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 334,
              height: 108,
              decoration: ShapeDecoration(
                color: const Color(0xFF313131),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          Positioned(
            left: 105,
            top: 9,
            child: SizedBox(
              width: 175,
              child: Text(
                widget.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 105,
            top: 35,
            child: SizedBox(
              width: 99,
              child: Text(
                widget.episodes,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 10.12,
            top: 10,
            child: Container(
              width: 80.05,
              height: 88,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.fill,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 280,
            top: 5,
            child: SizedBox(
              width: 30,
              height: 30,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
