import 'package:flutter/material.dart';
import '../pages/mediaDetailsPage.dart';

class MediaCard extends StatefulWidget {
  final String mediaType;
  final String mediaImgUrl;
  final String mediaTitle;

  const MediaCard({
    Key? key,
    required this.mediaType,
    required this.mediaImgUrl,
    required this.mediaTitle,
  }) : super(key: key);

  @override
  MediaCardState createState() => MediaCardState();
}

class MediaCardState extends State<MediaCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                MediaDetailsPage(widget.mediaType, widget.mediaTitle),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: SizedBox(
          width: 140,
          height: 200,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8.0),
                    ),
                    child: Image.network(
                      widget.mediaImgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  color: const Color(0xFF1C1C1C),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.mediaTitle,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
