import 'package:flutter/material.dart';
import 'package:shoppingmall/product_detal/product_detail.dart';
import 'package:shoppingmall/product_resistration/product_resistration.dart';
import 'package:intl/intl.dart';
import 'dart:io';

String formatPrice(int price) {
  final formatter = NumberFormat('#,###');
  return '${formatter.format(price)}';
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 상품 리스트 관리
  List<Map<String, dynamic>> items = [
    {
      "name": "일조농장 사과",
      "description": "신선한 사과 1박스",
      "price": 25000,
      "image": null,
    },
    {
      "name": "햇고구마",
      "description": "달콤한 고구마 5kg",
      "price": 15000,
      "image": null,
    },
    {
      "name": "제주 귤",
      "description": "싱싱한 제주도 귤 10kg",
      "price": 30000,
      "image": null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상품 목록'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return GestureDetector(
            onTap: () {
              // 아이템 데이터 전달
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    item: item, // 필수 파라미터 전달
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 0,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // 이미지 표시
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: item['image'] != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                item['image'],
                                fit: BoxFit.cover,
                                width: 120,
                                height: 120,
                              ),
                            )
                          : const Center(child: Text('이미지 없음')),
                    ),
                    const SizedBox(width: 22),
                    // 텍스트 영역
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name'],
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis, // 텍스트가 길면 '...' 처리
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item['description'],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            overflow: TextOverflow.ellipsis, // 설명도 '...' 처리
                            maxLines: 2, // 최대 2줄까지만 표시
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                formatPrice(item['price']),
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
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
          // ProductRegistration 호출
          final result = await Navigator.push<Map<String, dynamic>>(
            context,
            MaterialPageRoute(
              builder: (context) => const ProductRegistration(),
            ),
          );

          // 새 상품이 추가되었는지 확인 후 리스트 업데이트
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
