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
      "image": "assets/images/apple.jpg", // String 타입 경로
    },
    {
      "name": "햇고구마",
      "description": "달콤한 고구마 5kg",
      "price": 15000,
      "image": "assets/images/sweetpotato.jpg", // String 타입 경로
    },
    {
      "name": "제주 귤",
      "description": "싱싱한 제주도 귤 10kg",
      "price": 30000,
      "image": null, // 이미지가 없는 경우
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: item['image'] != null
                          ? item['image'] is String
                              ? Image.asset(
                                  item['image'], // String 타입이면 Image.asset 사용
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  item['image'], // File 타입이면 Image.file 사용
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                          : Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey[300],
                              child: const Center(
                                child: Icon(
                                  Icons.image_not_supported,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
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
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          // 상품 설명
                          Text(
                            item['description'],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 10),
                          // 가격 및 태그
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4B87FF),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: const Text(
                                  "일조농장",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 25),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 90,
                                    child: Text(
                                      formatPrice(item['price']),
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    "원",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
