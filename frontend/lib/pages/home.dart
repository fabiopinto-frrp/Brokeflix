import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    test();
    throw UnimplementedError();
  }

  Future<void> test() async {
    var token = await storage.read(key: "token");
    print("fabio");
    print(token);
  }
}
