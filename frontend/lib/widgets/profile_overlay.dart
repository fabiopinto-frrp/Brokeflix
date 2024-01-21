import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ProfileOverlayWidget extends StatelessWidget {
  final Function(ImageSource source) onImageSourceSelected;

  ProfileOverlayWidget({required this.onImageSourceSelected});

  get nameController => null;

  @override
Widget build(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      color:  Color(0xFF1C1C1C),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25.0),
        topRight: Radius.circular(25.0),
      ),
    ),
    child: Column(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.camera, color: Colors.white),
          title: const Text('Open Camera', style: TextStyle(color: Colors.white)),
          onTap: () {
            getImage(ImageSource.camera);
          },
        ),
        ListTile(
          leading: const Icon(Icons.photo_library, color: Colors.white),
          title: const Text('Choose from Gallery', style: TextStyle(color: Colors.white)),
          onTap: () {
            getImage(ImageSource.gallery);
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit, color: Colors.white),
          title: const Text('Change name', style: TextStyle(color: Colors.white)),
          onTap: () {
            showChangeNameDialog(context);
          },
        ),
      ],
    ),
  );
}

  void showChangeNameDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1C1C1C),
          title: const Text('Change Name', style: TextStyle(color: Colors.white)),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: 'Enter new name', hintStyle: TextStyle(color: Colors.white)),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK', style: TextStyle(color: Colors.white)),
              onPressed: () {
                onNameChanged(nameController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void onNameChanged(String text) {}

  void onImageSelected(File file) {
    updateUserProfile('userId', file, 'name');
  }

  Future<void> updateUserProfile(
      String username, File image, String name) async {
    final request = http.MultipartRequest('POST',
        Uri.parse('https://brokeflix-api.tech/api/users/$username/profile'));

    request.files.add(await http.MultipartFile.fromPath('image', image.path));
    request.fields['name'] = name;

    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        print('User profile updated successfully.');
      } else {
        print('Failed to update user profile: ${response.statusCode}');
      }
    } catch (e) {
      print('Failed to update user profile: $e');
    }
  }
  
  void getImage(ImageSource gallery) {}
}
