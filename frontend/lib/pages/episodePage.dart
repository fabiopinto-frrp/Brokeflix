import 'package:flutter/material.dart';
import './videoPlayerPage.dart';
import './mediaDetailsPage.dart';

class EpisodePage extends StatefulWidget {
  final String mediaType;
  final String title;
  final String mediaTitle;
  final List<Map<String, dynamic>> episodes;

  EpisodePage(this.mediaType, this.title, this.episodes, this.mediaTitle);

  @override
  _EpisodePageState createState() => _EpisodePageState();
}

class _EpisodePageState extends State<EpisodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1C),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(64.0),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.episodes.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 58, 58, 58),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: ListTile(
                        leading: Image.network(
                          widget.episodes[index]['imageUrl'],
                          width: 32.0,
                          height: 64.0,
                        ),
                        title: Text(
                          widget.episodes[index]['title'],
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 255, 255, 255)),
                        ),
                        subtitle: Text(
                          'Episode ${index + 1}',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: const Color.fromARGB(255, 255, 255, 255)),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoPlayerPage(
                                  widget.episodes[index]['epUrl'],
                                  widget.mediaType,
                                  widget.title,
                                  widget.episodes,
                                  widget.mediaTitle),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: 54.0,
            left: 20.0,
            child: IconButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              icon: Icon(Icons.arrow_back, color: Color(0xFFFA3D3B)),
            ),
          ),
        ],
      ),
    );
  }
}
