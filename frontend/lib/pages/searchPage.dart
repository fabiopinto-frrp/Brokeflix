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
  final storage = const FlutterSecureStorage();

  List<dynamic> allResults = [];
  List<dynamic> filteredResults = [];

  @override
  void initState() {
    super.initState();
    fetchSearchResults('');
  }

  Future<void> fetchSearchResults(String query) async {
    List<String> mediaTypes = ['animes', 'films', 'series'];
    allResults.clear();

    for (String mediaType in mediaTypes) {
      var url = Uri.parse(
          'https://brokeflix-api.tech/api/$mediaType?query=${Uri.encodeComponent(query)}');
      print('Fetching results from $url');
      try {
        var response = await http.get(url);
        if (response.statusCode == 200) {
          var results = jsonDecode(response.body);
          print('Got ${results.length} results');
          allResults.addAll(
              results.map((result) => {...result, 'mediaType': mediaType}));
        } else {
          throw Exception('Failed to load search results');
        }
      } catch (e) {
        print('Error fetching results: $e');
      }
    }

    setState(() {
      filteredResults = List.from(allResults);
    });
  }

  void updateQuery(String newQuery) {
    print('Updating query to $newQuery');

    if (newQuery.isEmpty) {
      setState(() {
        query = '';
        filteredResults = List.from(allResults);
      });
    } else {
      setState(() {
        query = newQuery;
        filteredResults = allResults
            .where((result) =>
                result['title'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 667),
      builder: (context, child) => Scaffold(
        appBar: TopBar(),
        backgroundColor: const Color(0xFF1C1C1C),
        body: ListView(
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                inputDecorationTheme: InputDecorationTheme(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFA3D3B)),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  onChanged: updateQuery,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Color(0xFFFA3D3B)),
                  ),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 30,
              ),
              itemCount: filteredResults.length,
              itemBuilder: (context, index) {
                return MediaCard(
                  mediaType: filteredResults[index]["mediaType"],
                  mediaImgUrl: filteredResults[index]["imageUrl"],
                  mediaTitle: filteredResults[index]["title"],
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: const BottomBar(),
      ),
    );
  }
}
