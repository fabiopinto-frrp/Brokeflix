import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ProfileOverlayWidget extends StatelessWidget {
  final Function(ImageSource source) onImageSourceSelected;

  ProfileOverlayWidget({required this.onImageSourceSelected});

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
            // Add your logic to change the name...
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

void onImageSelected(File file) {
  updateUserProfile('userId', file, 'name');
}

Future<void> updateUserProfile(String userId, File image, String name) async {
  final request = http.MultipartRequest(
      'POST', Uri.parse('http://your-server-url/user/$userId'));
  request.files.add(await http.MultipartFile.fromPath('image', image.path));
  request.fields['name'] = name;

}
