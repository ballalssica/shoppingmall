import 'package:flutter/material.dart';
import 'dart:io'; // File 사용을 위해 필요
import 'package:image_picker/image_picker.dart';
import 'package:shoppingmall/product_resistration/widget/inputbox.dart';
import 'package:shoppingmall/product_resistration/widget/resistration_button.dart';

class ProductRegistration extends StatefulWidget {
  const ProductRegistration({super.key});

  @override
  _ProductRegistrationState createState() => _ProductRegistrationState();
}

class _ProductRegistrationState extends State<ProductRegistration> {
  File? _selectedImage; // 선택된 이미지 파일 저장
  final ImagePicker _picker = ImagePicker(); // ImagePicker 인스턴스 생성

  // 이미지 선택 함수
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery); // 갤러리에서 이미지 선택
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path); // 선택된 이미지를 _selectedImage에 저장
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('농산물 등록하기'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _pickImage, // 이미지 선택 함수 호출
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
            ),
            const SizedBox(height: 25),
            InputBox(),
          ],
        ),
      ),
      bottomNavigationBar: const RegistrationButton(),
    );
  }
}
