import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MediaDetails {
  final String title;
  final String description;
  final String score;
  final String type;
  final String episodes;
  final String status;
  final String genres;
  final String imageUrl;

  MediaDetails({
    required this.title,
    required this.description,
    required this.score,
    required this.type,
    required this.episodes,
    required this.status,
    required this.genres,
    required this.imageUrl,
  });

  factory MediaDetails.fromJson(Map<String, dynamic> json) {
    return MediaDetails(
      title: json['title'],
      description: json['description'],
      score: json['score'],
      type: json['type'],
      episodes: json['episodes'],
      status: json['status'],
      genres: json['genres'],
      imageUrl: json['imageUrl'],
    );
  }
}

class MediaDetailsWidget extends StatefulWidget {
  final String mediaId;

  const MediaDetailsWidget({super.key, required this.mediaId});

  @override
  MediaDetailsWidgetState createState() => MediaDetailsWidgetState();
}

class MediaDetailsWidgetState extends State<MediaDetailsWidget> {
  late Future<MediaDetails> futureMediaDetails;

  @override
  void initState() {
    super.initState();
    futureMediaDetails = fetchMediaDetails(widget.mediaId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MediaDetails>(
      future: futureMediaDetails,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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
                        image: NetworkImage(snapshot.data!.imageUrl),
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
                    snapshot.data!.title,
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
                      snapshot.data!.description,
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
                          text: snapshot.data!.type,
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
                          text: snapshot.data!.episodes,
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
                          text: snapshot.data!.status,
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
                  top: 608,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Score : ',
                          style: TextStyle(
                            color: Color(0xFFD9D9D9),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: snapshot.data!.score,
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
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }

  Future<MediaDetails> fetchMediaDetails(String id) async {
    final response =
        await http.get(Uri.parse('https://your-api-url.com/media/$id'));

    if (response.statusCode == 200) {
      return MediaDetails.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load media details');
    }
  }
}
