import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 가격 포맷팅에 사용
import 'package:shoppingmall/product_cart/product_cart.dart';
import 'dart:io';
import 'package:shoppingmall/product_detal/widget/product_quantity_selector.dart'; // ProductQuantitySelector 가져오기

class ProductDetails extends StatelessWidget {
  final Map<String, dynamic> item;

  const ProductDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 이미지 표시
              if (item['image'] != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: item['image'] is String
                      ? Image.asset(
                          item['image'], // String 경로로 이미지 로드
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          item['image'], // File 객체로 이미지 로드
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                )
              else
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
              const SizedBox(height: 16),

              // 상품 이름
              Text(
                item['name'],
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // 상품 설명
              Text(
                item['description'],
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),

              // 상품 가격
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
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // ProductQuantitySelector 사용
      bottomNavigationBar: ProductQuantitySelector(
        item: item,
        onQuantityChanged: (quantity) {
          // Handle quantity changes
          print('Quantity changed to: $quantity');
        },
        // Changed from VoidCallback to Function(Map<String, dynamic>)
        onAddToCart: (cartItem) {
          // Add this parameter
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductCart(initialItems: [cartItem]),
            ),
          );
        },
      ),
    );
  }
}

// 가격 포맷팅 함수
String formatPrice(int price) {
  final formatter = NumberFormat('#,###');
  return formatter.format(price);
}
