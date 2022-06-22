import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class UserImagePicker extends StatefulWidget {
  // const UserImagePicker({Key key}) : super(key: key);
  UserImagePicker(this.imagePickFn);

  final void Function(File pickedImage) imagePickFn;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImage;

  void _pickImage() async {
    final pickedImageFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );
    setState(() {
      _pickedImage = File((pickedImageFile).path);
    });
    widget.imagePickFn(_pickedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage) : null,
          radius: 40.0,
          backgroundColor: Colors.teal.shade100,
        ),
        TextButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.image_outlined),
          label: const Text('Add Profile Picture'),
          style: TextButton.styleFrom(
              primary: Theme.of(context).colorScheme.tertiary),
        ),
      ],
    );
  }
}
