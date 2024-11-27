import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 가격 포맷팅에 사용
import 'dart:io';
import 'package:shoppingmall/product_detal/widget/product_quantity_selector.dart'; // ProductQuantitySelector 가져오기

class ProductDetails extends StatelessWidget {
  final Map<String, dynamic> item;

  const ProductDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          item['name'],
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 이미지 표시 (앱바 바로 아래에 위치)
            if (item['image'] != null)
              (item['image'] is String
                  ? Image.asset(
                      item['image'], // String 경로로 이미지 로드
                      width: double.infinity,
                      height: 300, // 높이를 300으로 설정
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      item['image'], // File 객체로 이미지 로드
                      width: double.infinity,
                      height: 300, // 높이를 300으로 설정
                      fit: BoxFit.cover,
                    ))
            else
              Container(
                width: double.infinity,
                height: 300, // 높이를 300으로 설정
                color: Colors.grey[300], // 배경색 설정
                child: const Center(
                  child: Icon(
                    Icons.image_not_supported, // "이미지가 없음" 아이콘
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              ),
            const SizedBox(height: 16),

            // 상품 정보
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 상품 가격
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // 양 끝 배치
                    children: [
                      // 왼쪽 끝 파란색 컨테이너 박스
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // 여백
                        decoration: BoxDecoration(
                          color: Color(0xFF4B87FF), // 박스 색상
                          borderRadius: BorderRadius.circular(10), // 라운드 처리
                        ),
                        child: const Text(
                          '일조농장', // 텍스트 내용
                          style: TextStyle(
                            fontSize: 16, // 텍스트 크기
                            fontWeight: FontWeight.bold, // 굵게
                            color: Colors.white, // 텍스트 색상
                          ),
                        ),
                      ),
                      // 오른쪽 끝 가격 텍스트
                      Row(
                        children: [
                          const Text(
                            '가격: ',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${formatPrice(item['price'])} 원',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // 상품 설명
                  Text(
                    item['description'],
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // ProductQuantitySelector 사용
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ProductQuantitySelector(
          item: item,
          onQuantityChanged: (quantity) {
            print('선택된 수량: $quantity');
          },
          onAddToCart: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${item['name']}이(가) 장바구니에 추가되었습니다.'),
              ),
            );
          },
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
