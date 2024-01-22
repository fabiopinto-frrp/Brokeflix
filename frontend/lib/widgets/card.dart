import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../pages/mediaDetailsPage.dart';

class MediaCard extends StatefulWidget {
  final String mediaType;
  final String mediaImgUrl;
  final String mediaTitle;

  const MediaCard({Key? key, required this.mediaType, required this.mediaImgUrl, required this.mediaTitle})
      : super(key: key);

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
                  builder: (context) => MediaDetailsPage(widget.mediaType, widget.mediaTitle),
                ),
              );
            },
            child: SizedBox(
              width: 140,
              height: 195,
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    Image.network(widget.mediaImgUrl),
                    Text(widget.mediaTitle),
                  ],
                ),
              ),
            ),
          );
        }
      }
    
  

