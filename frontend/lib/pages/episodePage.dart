import 'package:flutter/material.dart';

class EpisodePage extends StatefulWidget {
  final String mediaType;
  final String title;
  final List<Map<String, dynamic>> episodes;

  EpisodePage(this.mediaType, this.title, this.episodes);

  @override
  _EpisodePageState createState() => _EpisodePageState();
}

class _EpisodePageState extends State<EpisodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: widget.episodes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(widget.episodes[index]['imageUrl']),
            title: Text(widget.episodes[index]['title']),
            subtitle: Text('Episode ${index + 1}'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      VideoPlayerPage(widget.episodes[index]['epUrl']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
