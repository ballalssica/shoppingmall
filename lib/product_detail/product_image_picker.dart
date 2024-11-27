import 'package:flutter/material.dart';

class ProductImagePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250, // 이미지 영역 크기
      color: Colors.blue,
      child: Center(
        child: Icon(
          Icons.add,
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
