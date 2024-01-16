import 'package:flutter/material.dart';
import '../widgets/bottombar.dart';
import '../widgets/media_details.dart';
import '../widgets/arrowback.dart';

class MediaPage extends StatefulWidget {
  final String mediaId;

  const MediaPage({Key? key, required this.mediaId}) : super(key: key);

  @override
  MediaPageState createState() => MediaPageState();
}

class MediaPageState extends State<MediaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ArrowBackWidget(), 
      ),
      body: MediaDetailsWidget(mediaId: widget.mediaId),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
