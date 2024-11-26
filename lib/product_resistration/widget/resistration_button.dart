import 'package:flutter/material.dart';
import 'package:shoppingmall/home_page/home_page.dart';

class RegistrationButton extends StatelessWidget {
  final VoidCallback onPressed;
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;

  const RegistrationButton({
    super.key,
    required this.onPressed,
    required this.nameController,
    required this.descriptionController,
    required this.priceController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 95,
      child: OutlinedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // 팝업 전체 라운드 처리
              ),
              child: SizedBox(
                height: 185,
                width: 325,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                  children: [
                    // 상단 파란색 영역
                    Container(
                      height: 125,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20), // 상단 라운드 처리
                        ),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '등록이 완료되었습니다.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // 하단 확인 버튼
                    Container(
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20), // 하단 라운드 처리
                        ),
                      ),
                      alignment: Alignment.center, // 버튼 중앙 정렬
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context); // 팝업 닫기

                          // 데이터 가공
                          List<Map<String, dynamic>> data = [
                            {
                              "name": nameController.text,
                              "description": descriptionController.text.length > 10
                                  ? descriptionController.text.substring(0, 10) + "..."
                                  : descriptionController.text,
                              "price": priceController.text,
                            },
                          ];

                          // HomePage로 데이터 전달
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(data: data),
                            ),
                          );
                        },
                        child: const Text(
                          '확인',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: Colors.grey, width: 1.5),
        ),
        child: const Text(
          '등록하기',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
