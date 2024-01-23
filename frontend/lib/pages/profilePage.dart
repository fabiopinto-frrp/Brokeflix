import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../widgets/bottombar.dart';
import 'loginPage.dart';
import '../services/checkLogin.dart';
import '../widgets/profile_overlay.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final storage = FlutterSecureStorage();
  String fullName = '';
  String avatar = '';

  Future<Map<String, dynamic>> fetchUserData() async {
    // Read the user token from secure storage
    String? userToken = await storage.read(key: 'userToken');
    String? username = await storage.read(key: 'username');

    if (userToken == null || username == null) {
      print('No user token or username found'); // print a message for debugging
      return {}; // return an empty map
    }

    // Make a GET request to the API endpoint
    final response = await http.get(
      Uri.parse('https://brokeflix-api.tech/api/users/$username/profile'),
      headers: {
        'Authorization': 'Bearer $userToken',
      },
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      Map<String, dynamic> userData = jsonDecode(response.body);
      print('User data: $userData'); // print the user data
      return userData;
    } else {
      // If the server returns an error response, throw an exception.
      throw Exception('Failed to load user data');
    }
  }

  @override
  void initState() {
    super.initState();
    checkLoginStatus(context);
    fetchUserData().then((userData) {
      setState(() {
        fullName = userData['fullName'];
        avatar = userData['avatar'];
        print('Full name: $fullName'); // print the full name
        print('Avatar: $avatar');
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
      body: Stack(
        children: [
          Positioned(
            left: 250,
            top: 290,
            child: Container(
              padding: const EdgeInsets.all(0.1),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(32),
              ),
              child: IconButton(
                icon: Image(image: AssetImage('assets/Edit.png')),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return ProfileOverlayWidget(
                        onImageSourceSelected: (ImageSource source) {},
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Positioned(
            left: 120,
            top: 164,
            child: Container(
              width: 153,
              height: 153,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: avatar.isNotEmpty
                      ? NetworkImage(avatar)
                      : AssetImage('assets/DefaultAvatar.png') as ImageProvider<
                          Object>, // Explicit cast to ImageProvider<Object>
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(360),
                ),
              ),
            ),
          ),
          Positioned(
            left: 154,
            top: 341,
            child: Text(
              fullName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            left: 152,
            top: 687,
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFFFA3D3B)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
              ),
              onPressed: () {
                logout();
              },
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }

  Future<void> logout() async {
    await storage.delete(key: 'token');
    await storage.delete(key: 'expireDate');

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
    );
  }
}
