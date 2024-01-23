import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../pages/episodePage.dart';
import '../pages/videoPlayerPage.dart';

class MediaDetailsWidget extends StatefulWidget {
  final String title;
  final String description;
  final String numberOfEpisodes;
  final String status;
  final List<String> genres;
  final String imageUrl;
  final String mediaType;
  final String type;
  final String videoUrl;
  final String mediaTitle;
  final List<Map<String, dynamic>> episode;

  MediaDetailsWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.numberOfEpisodes,
    required this.status,
    required this.genres,
    required this.imageUrl,
    required this.mediaType,
    required this.type,
    required this.videoUrl,
    required this.episode,
    required this.mediaTitle,
  }) : super(key: key);

  @override
  MediaDetailsWidgetState createState() => MediaDetailsWidgetState();
}

class MediaDetailsWidgetState extends State<MediaDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 1.sw,
        height: 1.sh,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Color(0xFF1C1C1C)),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 1.sw,
                height: 0.5.sh,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0.w,
              top: 0.45.sh,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 1.sw,
                  height: 0.5.sh,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(42),
                        topRight: Radius.circular(42),
                      ),
                    ),
                    color: Color(0xFF1C1C1C),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
                        child: Row(
                          children: [
                            Text(
                              widget.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: GestureDetector(
                                onTap: () {
                                  if (widget.mediaType == 'animes' ||
                                      widget.mediaType == 'series') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EpisodePage(
                                            widget.type,
                                            widget.title,
                                            widget.episode,
                                            widget.mediaTitle),
                                      ),
                                    );
                                  } else if (widget.mediaType == 'films' &&
                                          widget.videoUrl != null ||
                                      widget.videoUrl != '') {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => VideoPlayerPage(
                                            widget.videoUrl,
                                            widget.mediaType,
                                            widget.title,
                                            widget.episode),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'No video available',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        backgroundColor: Color(0xFF1C1C1C),
                                      ),
                                    );
                                  }
                                },
                                child: Image.asset('assets/Play.png',
                                    width: 40, height: 40),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          widget.description,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Type : ',
                                style: TextStyle(
                                  color: Color(0xFFD9D9D9),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: widget.type,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      widget.mediaType == 'animes' ||
                              widget.mediaType == 'series'
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Episodes: ',
                                      style: TextStyle(
                                        color: Color(0xFFD9D9D9),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: widget.numberOfEpisodes,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Status : ',
                                style: TextStyle(
                                  color: Color(0xFFD9D9D9),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: widget.status,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
