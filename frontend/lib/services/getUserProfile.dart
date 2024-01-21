import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final storage = FlutterSecureStorage();

Future<Map<String, dynamic>> fetchUserData() async {
  String? token = await storage.read(key: 'token');
  String? username = await storage.read(key: 'username');
  var fullName = '';
  var avatar = '';

  if (token != null && username != null) {
    String apiUrl = 'https://brokeflix-api.tech/api/users/$username/profile';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {'authorization': 'Bearer $token'},
      );

      print('Response headers: ${response.headers}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        fullName = data['fullname'];
        avatar = data['avatar']; // assuming the response contains imageUrl
      } else {
        print(
            'Failed to load user profile. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  return {'fullName': fullName, 'avatar': avatar};
}
