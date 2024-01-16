import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/bottombar.dart';
import '../widgets/watch_list_card.dart';
import '../widgets/watch_list_topbar.dart';
import '../services/checkLogin.dart';

class WatchlistItem {
  final String imageUrl;
  final String name;
  final String episodes;

  WatchlistItem({required this.imageUrl, required this.name, required this.episodes});

  factory WatchlistItem.fromJson(Map<String, dynamic> json) {
    return WatchlistItem(
      imageUrl: json['imageUrl'],
      name: json['name'],
      episodes: json['episodes'],
    );
  }
}

class WatchListPage extends StatefulWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  WatchListPageState createState() => WatchListPageState();
}

class WatchListPageState extends State<WatchListPage> {
  int selectedIndex = 0; 

  @override
  void initState() {
    super.initState();
    checkLoginStatus(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          WatchListTopbar(
            selectedIndex: selectedIndex,
            onItemSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: FutureBuilder<List<WatchlistItem>>(
              future: fetchWatchlist(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return WatchlistCard(
                        imageUrl: snapshot.data![index].imageUrl,
                        name: snapshot.data![index].name,
                        episodes: snapshot.data![index].episodes,
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottonBar(),
    );
  }
  Future<List<WatchlistItem>> fetchWatchlist() async {
    final response = await http.get(Uri.parse('https://your-api-url.com/watchlist'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => WatchlistItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load watchlist');
    }
  }
}
