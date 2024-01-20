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
    return Column(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.camera),
          title: const Text('Open Camera'),
          onTap: () {
            getImage(ImageSource.camera);
          },
        ),
        ListTile(
          leading: const Icon(Icons.photo_library),
          title: const Text('Choose from Gallery'),
          onTap: () {
            getImage(ImageSource.gallery);
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Change name'),
          onTap: () {
            showChangeNameDialog(context);
          },
        ),
      ],
    );
  }
}

Future<void> getImage(ImageSource source) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: source);

  if (pickedFile != null) {
    onImageSelected(File(pickedFile.path));
  } else {
    print('No image selected.');
  }
}

void showChangeNameDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Change Name'),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: 'Enter new name'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
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
  
  void onNameChanged(String text) {
  }


void onImageSelected(File file) {
  updateUserProfile('userId', file, 'name');
}

Future<void> updateUserProfile(String username, File image, String name) async {
  final request = http.MultipartRequest(
    'POST', 
    Uri.parse('https://brokeflix-api.tech/api/users/$username/profile')
  );

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
