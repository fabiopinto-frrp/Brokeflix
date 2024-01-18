import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../pages/mediaDetailsPage.dart';

class MediaCard extends StatefulWidget {
  final String mediaType;
  final String mediaId;

  const MediaCard({Key? key, required this.mediaType, required this.mediaId})
      : super(key: key);

  @override
  MediaCardState createState() => MediaCardState();
}

class MediaCardState extends State<MediaCard> {
  Future<Map<String, dynamic>> fetchMedia() async {
    final response = await http.get(Uri.parse(
        'https://api.example.com/${widget.mediaType}/${widget.mediaId}'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load media');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: fetchMedia(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MediaDetailsPage(
                      mediaId: snapshot.data!['id'].toString()),
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
                    Image.network(snapshot.data!['imageUrl']),
                    Text(snapshot.data!['title']),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
