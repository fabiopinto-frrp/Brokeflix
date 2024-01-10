import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            test();
          },
          child: const Text("Test"),
        ),
      ),
    );
  }

  Future<void> test() async {
    var token = await storage.read(key: "token");
    print("fabio");
    print(token);
  }
}
