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
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // 이미지 선택 후 처리
  void _handleImagePicked(File? image) {
    setState(() {
      _selectedImage = image; // 선택된 이미지를 상태에 저장
    });
  }

  void _submitData() {
    // 입력 데이터 유효성 검사
    if (nameController.text.isEmpty ||
        priceController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        _selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("모든 항목을 입력해주세요!")),
      );
      return;
    }

    // 데이터를 HomePage로 전달
    Navigator.pop(context, {
      "name": nameController.text,
      "price": int.parse(priceController.text.replaceAll(',', '')),
      "description": descriptionController.text,
      "image": _selectedImage,
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
            InputBox(
              nameController: nameController,
              priceController: priceController,
              descriptionController: descriptionController,
            ),
          ],
        ),
      ),
      bottomNavigationBar: RegistrationButton(onPressed: _submitData),
    );
  }
}
