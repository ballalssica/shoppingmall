import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CustomImagePicker extends StatefulWidget {
  final Function(File?) onImagePicked; // 이미지 선택 후 처리 함수 전달

  const CustomImagePicker({super.key, required this.onImagePicked});

  @override
  _CustomImagePickerState createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? _selectedImage; // 선택된 이미지를 저장하는 변수
  final ImagePicker _picker = ImagePicker(); // ImagePicker 인스턴스 생성

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery, // 갤러리에서 이미지 선택
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path); // 선택된 이미지 저장
      });
      widget.onImagePicked(_selectedImage); // 부모 위젯에 이미지 전달
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage, // 아이콘 클릭 시 이미지 선택
      child: Container(
        height: 300,
        color: Color(0xFF4B87FF),
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
