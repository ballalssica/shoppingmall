import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 가격 포맷팅에 사용

class ProductDetails extends StatelessWidget {
  final Map<String, dynamic> item;

  const ProductDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']), // 상품 이름을 앱바 제목으로 사용
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 이미지 표시
            if (item['image'] != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  item['image'], // 이미지 파일
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              )
            else
              const Center(child: Text('이미지 없음')), // 이미지가 없을 때 표시
            const SizedBox(height: 16),
            // 상품 설명
            Text(
              item['description'],
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            // 상품 가격
            Text(
              '가격: ${formatPrice(item['price'])} 원',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 가격 포맷팅 함수
String formatPrice(int price) {
  final formatter = NumberFormat('#,###');
  return '${formatter.format(price)}';
}
