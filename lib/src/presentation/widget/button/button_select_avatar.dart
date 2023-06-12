import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money/src/providers/auth_provider.dart';
import 'package:provider/provider.dart';

typedef SetImage = void Function(File);

class ButtonSelectAvatar extends StatefulWidget {
  const ButtonSelectAvatar({super.key});

  @override
  State<ButtonSelectAvatar> createState() => _ButtonSelectAvatarState();
}

class _ButtonSelectAvatarState extends State<ButtonSelectAvatar> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AuthState>(context);
    File? _selectedImage;

    Future<void> _uploadImage(ImageSource source) async {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: source);

      setState(() {
        if (pickedImage != null) {
          _selectedImage = File(pickedImage.path);
        }
      });

      if (_selectedImage == null) return;

      // final reference = storage.ref().child(
      //     'user/${appState.user!.uid}/images/${DateTime.now().toString()}');

      // await reference.putFile(_selectedImage);
      // final imageUrl = await reference.getDownloadURL();
    }

    return Column(
      children: [
        SizedBox(
            height: 100,
            width: 100,
            child: RawMaterialButton(
                shape: const CircleBorder(),
                fillColor: Colors.white,
                onPressed: () => _uploadImage(ImageSource.gallery),
                child: _selectedImage == null
                    ? const Icon(Icons.photo_camera)
                    : CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(_selectedImage!),
                      ))),
      ],
    );
  }
}
