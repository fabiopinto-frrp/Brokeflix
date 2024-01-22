import 'package:flutter/material.dart';

class MediaDetailsWidget extends StatefulWidget {
  final String title;
  final String description;
  final String type;
  final String numberOfEpisodes;
  final String status;
  final List<String> genres;
  final String imageUrl;

  MediaDetailsWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.type,
    required this.numberOfEpisodes,
    required this.status,
    required this.genres,
    required this.imageUrl,
  }) : super(key: key);

  @override
  MediaDetailsWidgetState createState() => MediaDetailsWidgetState();
}

class MediaDetailsWidgetState extends State<MediaDetailsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393,
      height: 852,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: Color(0xFF1C1C1C)),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 393,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 324,
            child: Container(
              width: 393,
              height: 528,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(64),
                    topRight: Radius.circular(64),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 30,
            top: 368,
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            left: 30,
            top: 426,
            child: SizedBox(
              width: 327,
              height: 126,
              child: Text(
                widget.description,
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
            left: 30,
            top: 578,
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Type : ',
                    style: TextStyle(
                      color: Color(0xFFD9D9D9),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: widget.type,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 30,
            top: 637,
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Episodes: ',
                    style: TextStyle(
                      color: Color(0xFFD9D9D9),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: widget.numberOfEpisodes,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 30,
            top: 666,
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Status : ',
                    style: TextStyle(
                      color: Color(0xFFD9D9D9),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: widget.status,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
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
