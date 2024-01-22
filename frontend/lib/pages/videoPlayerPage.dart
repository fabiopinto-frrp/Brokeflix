import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  final String videoUrl;

  VideoPlayerPage(this.videoUrl);

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
      // Try playing around with some of these other options:
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
      body: Center(
        child: Chewie(
          controller: _chewieController,
        ),
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
