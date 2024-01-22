import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../services/checkLogin.dart';
import '../widgets/card.dart';
import '../widgets/bottomBar.dart';
import '../widgets/topbar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  String query = '';
  late Future<List<dynamic>> futureSearchResults;
  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    futureSearchResults = fetchSearchResults(query);
  }

  Future<List<dynamic>> fetchSearchResults(String query) async {
    List<String> mediaTypes = ['animes', 'films', 'series'];
    List<dynamic> allResults = [];

    for (String mediaType in mediaTypes) {
      var url = Uri.parse(
          'https://brokeflix-api.tech/api/$mediaType?query=${Uri.encodeComponent(query)}');
      print('Fetching results from $url'); // Debug print
      try {
        var response = await http.get(url);
        if (response.statusCode == 200) {
          var results = jsonDecode(response.body);
          print('Got ${results.length} results'); // Debug print
          allResults.addAll(
              results.map((result) => {...result, 'mediaType': mediaType}));
        } else {
          throw Exception('Failed to load search results');
        }
      } catch (e) {
        print('Error fetching results: $e'); // Debug print
      }
    }

    return allResults;
  }

  void updateQuery(String newQuery) {
    print('Updating query to $newQuery'); // Debug print
    setState(() {
      query = newQuery;
      futureSearchResults = fetchSearchResults(query);
    });
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
              // Your search input field
              TextField(
                onChanged: updateQuery,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search...',
                ),
              ),
              // Display mixed search results
              SizedBox(
                height: 200.h,
                child: FutureBuilder<List<dynamic>>(
                  future: futureSearchResults,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: MediaCard(
                              mediaType: snapshot.data![index]["mediaType"],
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
          ),
        ),
        bottomNavigationBar: const BottomBar(),
      ),
    );
  }
}
