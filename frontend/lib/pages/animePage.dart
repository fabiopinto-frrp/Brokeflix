import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../services/checkLogin.dart';
import '../widgets/card.dart';
import '../widgets/bottomBar.dart';
import '../widgets/topbar.dart';

class AnimePage extends StatefulWidget {
  const AnimePage({Key? key}) : super(key: key);

  @override
  AnimePageState createState() => AnimePageState();
}

class AnimePageState extends State<AnimePage> {
  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    checkLoginStatus(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            TopBar(), // instead of topBar -> Search Button that will create a dynamic page with the searchBar
        backgroundColor: const Color(0xFF1C1C1C),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              MediaSection(title: 'Actiom', mediaType: 'animes'),
              MediaSection(title: 'Romance', mediaType: 'animes'),
              MediaSection(title: 'Fantasy', mediaType: 'animes'),
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
                child:
                    MediaCard(mediaType: mediaType, mediaId: index.toString()),
              );
            },
          ),
        ),
      ],
    );
  }
}
