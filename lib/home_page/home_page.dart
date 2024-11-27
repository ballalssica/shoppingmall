import 'package:flutter/material.dart';
import 'package:shoppingmall/product_detal/product_detail.dart';
import 'package:shoppingmall/product_resistration/product_resistration.dart';
import 'package:intl/intl.dart';

String formatPrice(int price) {
  final formatter = NumberFormat('#,###');
  return '${formatter.format(price)}';
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> items = [
    {
      "name": "일조농장 사과",
      "description": "신선한 사과 1박스",
      "price": 25000,
      "image": "assets/images/apple.jpg",
    },
    {
      "name": "햇고구마",
      "description": "달콤한 고구마 5kg",
      "price": 15000,
      "image": "assets/images/sweetpotato.jpg",
    },
    {
      "name": "제주 귤",
      "description": "싱싱한 제주도 귤 10kg",
      "price": 30000,
      "image": "assets/images/orange.jpeg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('일조동'),
        centerTitle: false,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // 장바구니 버튼 동작
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // 알림 버튼 동작
            },
          ),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: items.length,
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
          height: 1,
        ),
        itemBuilder: (context, index) {
          final item = items[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(item: item),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05), // 낮은 강도의 쉐도우
                    blurRadius: 5, // 그림자 퍼짐
                    spreadRadius: 1, // 그림자 크기
                    offset: const Offset(0, 2), // 아래쪽으로만 그림자 적용
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // 이미지 표시
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: item['image'] != null
                          ? item['image'] is String
                              ? Image.asset(
                                  item['image'], // String 타입이면 Image.asset 사용
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                )
                              : Image.file(
                                  item['image'], // File 타입이면 Image.file 사용
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                )
                          : const Center(child: Text('이미지 없음')), // null이면 기본 메시지 표시
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 상품 이름
                          Text(
                            item['name'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          // 상품 설명
                          Text(
                            item['description'],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          const SizedBox(height: 12),
                          // 가격
                          Text(
                            "${formatPrice(item['price'])} 원",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push<Map<String, dynamic>>(
            context,
            MaterialPageRoute(
              builder: (context) => const ProductRegistration(),
            ),
          );

          if (result != null) {
            setState(() {
              items.add(result);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
