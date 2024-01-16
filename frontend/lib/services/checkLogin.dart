import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../pages/login.dart';
import '../pages/home.dart';

final storage = FlutterSecureStorage();

Future<void> checkLoginStatus(BuildContext context) async {
  var token = await storage.read(key: "token");
  var expireDateString = await storage.read(key: "expireDate") ?? '';

  if (token == null || expireDateString.isEmpty) {
    await storage.delete(key: "token");
    await storage.delete(key: "username");
    await storage.delete(key: "expireDate");
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
    );
  } else {
    DateTime expireDate = DateTime.parse(expireDateString);
    if (DateTime.now().isAfter(expireDate)) {
      await storage.delete(key: "token");
      await storage.delete(key: "username");
      await storage.delete(key: "expireDate");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
      );
    }
  }
}

Future<void> checkLoggedUser(BuildContext context) async {
  var token = await storage.read(key: "token");
  var expireDateString = await storage.read(key: "expireDate") ?? '';

  if (token != null && expireDateString.isNotEmpty) {
    DateTime expireDate = DateTime.parse(expireDateString);
    if (DateTime.now().isBefore(expireDate)) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => HomePage()),
      );
    } else {
      await storage.delete(key: "token");
      await storage.delete(key: "expireDate");
      Navigator.pushReplacementNamed(context, '/splash');
    }
  } else {
    await storage.delete(key: "expireDate");
    await storage.delete(key: "token");
    Navigator.pushReplacementNamed(context, '/splash');
  }
}
