import 'package:flutter/material.dart';
import '../widgets/bottonbar.dart';
import '../widgets/watch_list_card.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  WatchListPageState createState() => WatchListPageState();
}

class WatchListPageState extends State<WatchListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            
          },
          child: const Text(""),
        ),
      ),
    );
    
    
  }
}
