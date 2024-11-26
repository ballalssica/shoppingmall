import 'package:flutter/material.dart';
import 'dart:io';
import 'package:shoppingmall/product_resistration/widget/custom_image_picker.dart';
import 'widget/inputbox.dart';
import 'widget/resistration_button.dart';

class ProductRegistration extends StatefulWidget {
  const ProductRegistration({super.key});

  @override
  _ProductRegistrationState createState() => _ProductRegistrationState();
}

class _ProductRegistrationState extends State<ProductRegistration> {
  File? _selectedImage; // 선택된 이미지 파일 저장

  // 이미지 선택 후 처리
  void _handleImagePicked(File? image) {
    setState(() {
      _selectedImage = image; // 선택된 이미지를 상태에 저장
    });
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
            CustomImagePicker(
              onImagePicked: _handleImagePicked, // 이미지 선택 후 처리
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

