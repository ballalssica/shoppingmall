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
  // 상품 리스트 관리
  List<Map<String, dynamic>> items = [
    {
      "name": "일조농장 사과",
      "description": "신선한 사과 1박스",
      "price": 25000,
    },
    {
      "name": "햇고구마",
      "description": "달콤한 고구마 5kg",
      "price": 15000,
    },
    {
      "name": "제주 귤",
      "description": "싱싱한 제주도 귤 10kg",
      "price": 30000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('일조동'),
        centerTitle: false,
        titleTextStyle: const TextStyle(
    fontSize: 20, // 제목 크기 22로 설정
    fontWeight: FontWeight.normal, // 볼드 제거
    color: Colors.black87, // 제목 색상 설정
        ),
        actions: [
    IconButton(
      icon: const Icon(Icons.shopping_cart), // 장바구니 아이콘
      onPressed: () {
        // 장바구니 버튼 눌렀을 때 동작
      },
    ),
    IconButton(
      icon: const Icon(Icons.notifications), // 알림 아이콘
      onPressed: () {
        // 알림 버튼 눌렀을 때 동작
      },
    ),
  ],
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
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(child: Text('이미지')),
                    ),
                    const SizedBox(width: 22),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'],
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 230,
                          child: Text(
                            item['description'],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF4B87FF),
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
                              children: [Container(
                                width: 90,
                                child: 
                                Text(formatPrice(item['price']),
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigator.push()로 ProductRegistration 호출
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
