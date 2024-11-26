import 'package:flutter/material.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('장바구니'),
      ),
      body: const Center(
        child: Text(
          'Hello!!!!!',
          style: TextStyle(fontFamily: 'NotoSans'),
        ),
      ),
    );
  }
}
