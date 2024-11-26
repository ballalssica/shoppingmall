import 'package:flutter/material.dart';
import 'package:shoppingmall/product_resistration/widget/image_picker.dart';
import 'package:shoppingmall/product_resistration/widget/inputbox.dart';
import 'package:shoppingmall/product_resistration/widget/resistration_button.dart';

class ProductRegistration extends StatelessWidget {
  const ProductRegistration({super.key});

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
            const ImagePicker(),
            const SizedBox(height: 25),
            InputBox(),
          ],
        ),
      ),
      bottomNavigationBar: const RegistrationButton(),
    );
  }
}