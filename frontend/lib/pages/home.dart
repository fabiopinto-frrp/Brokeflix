import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../services/checkLogin.dart';
import '../widgets/card.dart';
import '../widgets/bottomBar.dart';
import '../widgets/topbar.dart';

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
        appBar: TopBar(),
        backgroundColor: const Color(0xFF1C1C1C),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              MediaSection(title: 'Movies', mediaType: 'movies'),
              MediaSection(title: 'Series', mediaType: 'series'),
              MediaSection(title: 'Animes', mediaType: 'animes'),
            ],
          ),
        ),
        bottomNavigationBar: const BottomBar());
  }
}

class MediaSection extends StatelessWidget {
  final String title;
  final String mediaType;

  const MediaSection({Key? key, required this.title, required this.mediaType})
      : super(key: key);

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
            title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: MediaCard(mediaType: mediaType, mediaId: 'yourMediaId'),
              );
            },
          ),
        ),
      ],
    );
  }
}
