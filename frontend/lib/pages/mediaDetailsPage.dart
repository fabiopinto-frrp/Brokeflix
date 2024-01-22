import 'package:flutter/material.dart';
import '../widgets/bottombar.dart';
import '../widgets/media_details.dart';
import '../widgets/arrowback.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MediaDetailsPage extends StatefulWidget {
  final String mediaType;
  final String mediaTitle;

  MediaDetailsPage(this.mediaType, this.mediaTitle, {Key? key})
      : super(key: key);

  @override
  MediaDetailsPageState createState() => MediaDetailsPageState();
}

class MediaDetailsPageState extends State<MediaDetailsPage> {
  late Future<dynamic> futureMediaDetails;

  Future<dynamic> fetchMediaDetails() async {
    var url = Uri.parse(
        'https://brokeflix-api.tech/api/${widget.mediaType}/?title=${Uri.encodeComponent(widget.mediaTitle)}');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load media details');
    }
  }

  @override
  void initState() {
    super.initState();
    futureMediaDetails = fetchMediaDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ArrowBackWidget(),
      ),
      body: FutureBuilder<dynamic>(
        future: futureMediaDetails,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data[0]; // Access the first object in the list
            return MediaDetailsWidget(
              title: data['title'],
              description: data['description'],
              type: data['type'],
              numberOfEpisodes: data['numberOfEpisodes'],
              status: data['status'],
              genres: (data['genres'] as List).map((item) => item.toString()).toList(),
              imageUrl: data['imageUrl'],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
