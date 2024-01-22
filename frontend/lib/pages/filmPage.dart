import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../services/checkLogin.dart';
import '../widgets/card.dart';
import '../widgets/bottomBar.dart';
import '../widgets/topbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FilmPage extends StatefulWidget {
  final String mediaType;
  final String title;

  const FilmPage({Key? key, required this.title, required this.mediaType})
      : super(key: key);

  @override
  FilmPageState createState() => FilmPageState();
}

class FilmPageState extends State<FilmPage> {
  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    checkLoginStatus(context);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 667),
      builder: (context, child) => Scaffold(
        appBar: TopBar(),
        backgroundColor: const Color(0xFF1C1C1C),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MediaSection(
                  title: 'Action', genre: 'Action', mediaType: 'films'),
              MediaSection(
                  title: 'Romance', genre: 'Romance', mediaType: 'films'),
              MediaSection(
                  title: 'Fantasy', genre: 'Fantasy', mediaType: 'films'),
            ],
          ),
        ),
        bottomNavigationBar: const BottomBar(),
      ),
    );
  }
}

class MediaSection extends StatefulWidget {
  final String title;
  final String mediaType;
  final String genre;

  MediaSection(
      {required this.title, required this.mediaType, required this.genre});

  @override
  MediaSectionState createState() => MediaSectionState();
}

class MediaSectionState extends State<MediaSection> {
  late Future<List<dynamic>> futureMediaData;

  Future<List<dynamic>> fetchMediaData(String mediaType, String genre) async {
    var url =
        Uri.parse('https://brokeflix-api.tech/api/$mediaType/genres/$genre');
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
    futureMediaData = fetchMediaData(widget.mediaType, widget.genre);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 35.w,
            right: 35.w,
            top: 15.h,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 200.h,
          child: FutureBuilder<List<dynamic>>(
            future: futureMediaData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: MediaCard(
                        mediaType: widget.mediaType,
                        mediaImgUrl: snapshot.data![index]["imageUrl"],
                        mediaTitle: snapshot.data![index]["title"],
                      ),
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
