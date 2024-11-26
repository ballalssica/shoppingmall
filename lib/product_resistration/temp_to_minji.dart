// File: lib/product_resistration/widget/inputbox.dart
import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;

  const InputBox({
    super.key,
    required this.nameController,
    required this.priceController,
    required this.descriptionController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                '상품 이름',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: '상품 이름을 입력하세요.',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '상품 가격',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: '숫자만 입력 가능해요.',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                '원',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              const Text(
                '상품 설명',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: SizedBox(
                  height: 300,
                  child: TextField(
                    controller: descriptionController,
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      hintText: '상품 설명을 입력해주세요.',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// File: lib/product_resistration/product_resistration.dart
import 'package:flutter/material.dart';
import '../models/product.dart';
import 'widget/image_picker.dart';
import 'widget/inputbox.dart';
import 'widget/resistration_button.dart';

class ProductRegistration extends StatefulWidget {
  const ProductRegistration({super.key});

  @override
  State<ProductRegistration> createState() => _ProductRegistrationState();
}

class _ProductRegistrationState extends State<ProductRegistration> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String imageUrl = '';

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _handleImageSelected(String url) {
    setState(() {
      imageUrl = url;
    });
  }

  void _handleRegistration() {
    // Basic validation
    if (nameController.text.isEmpty ||
        priceController.text.isEmpty ||
        descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('모든 필드를 입력해주세요.')),
      );
      return;
    }

    // Create product object
    final product = Product(
      image: imageUrl,
      name: nameController.text,
      description: descriptionController.text,
      price: double.tryParse(priceController.text) ?? 0,
    );

    // Return the product to the previous screen
    Navigator.pop(context, product);
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
            ImagePicker(onImageSelected: _handleImageSelected),
            const SizedBox(height: 25),
            InputBox(
              nameController: nameController,
              priceController: priceController,
              descriptionController: descriptionController,
            ),
          ],
        ),
      ),
      bottomNavigationBar: RegistrationButton(
        onPressed: _handleRegistration,
      ),
    );
  }
}