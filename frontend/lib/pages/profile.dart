import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/bottombar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'login.dart';
import '../services/checkLogin.dart';
import '../widgets/profile_overlay.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final storage = new FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    checkLoginStatus(context);
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
                icon: const Image(image: AssetImage('assets/Edit.png')),
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
                image: const DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/153x153"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(360),
                ),
              ),
            ),
          ),
          const Positioned(
            left: 154,
            top: 341,
            child: Text(
              'BROKEFLIX',
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
