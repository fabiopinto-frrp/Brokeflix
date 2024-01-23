import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import './episodePage.dart';
import './mediaDetailsPage.dart';

class VideoPlayerPage extends StatefulWidget {
  final String videoUrl;
  final String mediaType;
  final String mediaTitle;
  final List<Map<String, dynamic>> episodes;

  VideoPlayerPage(this.videoUrl, this.mediaType, this.mediaTitle, this.episodes,
      {Key? key})
      : super(key: key);

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: false,
      fullScreenByDefault: true,
      showControls: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: const Color(0xFF1C1C1C),
        backgroundColor: const Color(0xFF1C1C1C),
        bufferedColor: const Color(0xFFFA3D3B),
      ),
      placeholder: Container(
        color: Colors.grey,
      ),
      autoInitialize: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Center(
            child: Chewie(
              controller: _chewieController,
            ),
          ),
          Positioned(
            right: 330,
            top: 50,
            child: FloatingActionButton(
              onPressed: () {
                if (widget.mediaType == 'animes') {
                  if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
                } else if (widget.mediaType == 'films') {
                  if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
                }
              },
              backgroundColor: Color(0xFF1C1C1C),
              child: Icon(Icons.arrow_back, color: Color(0xFFFA3D3B)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _chewieController.dispose();
  }
}
