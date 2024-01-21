import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/card.dart';

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  String query = '';
  String selectedMediaType = 'animes'; 
  List<dynamic> results = [];

  Future<void> search() async {
    final response = await http.get(Uri.parse(
        'https://brokeflix-api.tech/api/search?mediaType=$selectedMediaType&title=$query'));

    if (response.statusCode == 200) {
      setState(() {
        results = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load search results');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1C1C),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: const Color(0xFFFA3D3B),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    dropdownColor: const Color(0xFF1C1C1C),
                    style: TextStyle(color: Colors.white),
                    value: selectedMediaType,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedMediaType = newValue!;
                      });
                    },
                    items: <String>['animes', 'films', 'series']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        query = value;
                      });
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: search,
                  icon: Icon(Icons.search),
                  color: const Color(0xFFFA3D3B),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                return MediaCard(
                  mediaType: selectedMediaType,
                  mediaId: results[index]['id'].toString(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
