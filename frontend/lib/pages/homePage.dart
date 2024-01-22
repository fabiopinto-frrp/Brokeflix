import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../services/checkLogin.dart';
import '../widgets/card.dart';
import '../widgets/bottomBar.dart';
import '../widgets/topbar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    checkLoginStatus(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: TopBar(),
        backgroundColor: const Color(0xFF1C1C1C),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MediaSection(title: 'Movies', mediaType: 'films'),
              MediaSection(title: 'Series', mediaType: 'series'),
              MediaSection(title: 'Animes', mediaType: 'animes'),
            ],
          ),
        ),
        bottomNavigationBar: const BottomBar());
  }
}

class MediaSection extends StatefulWidget {
  final String title;
  final String mediaType;

  MediaSection({required this.title, required this.mediaType});

  @override
  MediaSectionState createState() => MediaSectionState();
}

class MediaSectionState extends State<MediaSection> {
  late Future<List<dynamic>> futureMediaData;

  Future<List<dynamic>> fetchMediaData(String mediaType) async {
    var url = Uri.parse('https://brokeflix-api.tech/api/$mediaType/random/5');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load media data');
    }
  }

  @override
  void initState() {
    super.initState();
    futureMediaData = fetchMediaData(widget.mediaType);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 45,
            left: 35,
            right: 35,
          ),
          child: Text(
            widget.title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 220,
          child: FutureBuilder<List<dynamic>>(
            future: futureMediaData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MediaCard(
                          mediaType: widget.mediaType,
                          mediaImgUrl: snapshot.data![index]["imageUrl"],
                          mediaTitle: snapshot.data![index]["title"]),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ],
    );
  }
}
