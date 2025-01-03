import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final storage = FlutterSecureStorage();

Future<Map<String, dynamic>> fetchUserData() async {
  String? token = await storage.read(key: 'token');
  String? username = await storage.read(key: 'username');
  var fullname = '';
  var avatar = '';

  if (token != null && username != null) {
    String apiUrl = 'https://brokeflix-api.onrender.com/api/users/$username/profile';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {'Authorization': 'Bearer $token'},
      );

      print('Response headers: ${response.headers}');
      print('Response body: ${response.body}');
      print(apiUrl);
      print(token);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        fullname = data['fullname'];
        avatar = data['avatar']; // assuming the response contains imageUrl
        print(fullname);
        print(avatar);
      } else {
        print(
            'Failed to load user profile. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching user data: $e');
      print(fullname);
      print(avatar);
      
    }
  }
  print(fullname);
  print(avatar);
  return {'fullName': fullname, 'avatar': avatar};
}
