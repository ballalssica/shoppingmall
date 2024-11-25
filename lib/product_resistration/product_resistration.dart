import 'package:flutter/material.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            color: Colors.blue,
            child: const Center(
              child: Text('이미지등록하기'),
            ),
          ),

          Container(
            child: const Text('상품등록'),
          ),
          
           Container(
            child: const Text('상품등록버튼'),
          )         

        ],
      )
    );
  }
}