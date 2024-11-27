import 'package:flutter/material.dart';
import 'product_image_picker.dart';
import 'product_detail_info.dart';
import 'add_to_cart_button.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          '신선야채 당근 1kg',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImagePicker(),
            ProductDetailInfo(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: AddToCartButton(),
      ),
    );
  }
}