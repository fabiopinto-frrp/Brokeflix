import 'package:flutter/material.dart';
import '../widgets/bottombar.dart';
import '../widgets/media_details.dart';
import '../widgets/arrowback.dart';

class MediaDetailsPage extends StatefulWidget {
  final String mediaId;

  const MediaDetailsPage({Key? key, required this.mediaId}) : super(key: key);

  @override
  MediaDetailsPageState createState() => MediaDetailsPageState();
}

class MediaDetailsPageState extends State<MediaDetailsPage> {
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
