import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({
    super.key,
    required this.onSelectImage,
  });

  final void Function(File image) onSelectImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery, maxWidth: 600);

    if (pickedImage == null) {
      return;
    }
    setState(() {
      _selectImage = File(pickedImage.path);
    });

    widget.onSelectImage(_selectImage!);
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object> backgroundImage =
        const AssetImage('assets/EmptyPicture.png');

    if (_selectImage != null) {
      backgroundImage = FileImage(_selectImage!);
    }
    return Column(
      children: [
        GestureDetector(
          onTap: _takePicture,
          child: CircleAvatar(
            radius: 50,
            // backgroundColor: Colors.black,
            backgroundImage: backgroundImage,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        OutlinedButton.icon(
          onPressed: _takePicture,
          icon: const Icon(Icons.camera_alt),
          label: const Text('Add Photo'),
        ),
      ],
    );
  }
}
