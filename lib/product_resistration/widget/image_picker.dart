import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _selectedImage; // 선택한 이미지를 저장하는 변수
  final ImagePicker _picker = ImagePicker(); // ImagePicker 인스턴스 생성

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery, // 갤러리에서 이미지 선택
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path); // 선택된 이미지 저장
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage, // 아이콘 클릭 시 이미지 선택
      child: Container(
        height: 300,
        color: Colors.blue,
        child: _selectedImage == null
            ? const Center(
                child: Icon(
                  Icons.add,
                  size: 50,
                  color: Colors.white,
                ),
              )
            : Image.file(
                _selectedImage!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
      ),
    );
  }
}
