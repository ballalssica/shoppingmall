import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상품상세'),
      ),
      body: const Center(
        child: Text(
          'Hello!!!!!',
          style: TextStyle(
            fontFamily: 'NotoSnas'
          )
        ),
      ),
    );
  }
}