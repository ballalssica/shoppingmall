import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // TextInputFormatter 사용
import 'package:intl/intl.dart'; // 숫자 포맷팅용 패키지

class InputBox extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;

  const InputBox({
    super.key,
    required this.nameController,
    required this.priceController,
    required this.descriptionController,
  });

  void _formatNumber(String value) {
    String newValue = value.replaceAll(',', ''); // 기존 콤마 제거
    if (newValue.isNotEmpty) {
      final formattedValue =
          NumberFormat.decimalPattern('en').format(int.parse(newValue));
      priceController.value = TextEditingValue(
        text: formattedValue,
        selection: TextSelection.collapsed(offset: formattedValue.length), // 커서 위치 유지
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 상품 이름 입력 필드
          Row(
            children: [
              const Text(
                '상품 이름',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: '상품 이름을 입력하세요.',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),

          // 상품 가격 입력 필드
          Row(
            children: [
              const Text(
                '상품 가격',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // 숫자만 입력 가능
                  ],
                  onChanged: _formatNumber, // 입력값 포맷팅
                  decoration: InputDecoration(
                    hintText: '숫자만 입력 가능해요.',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                '원',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),

          // 상품 설명 입력 필드
          Row(
            children: [
              const Text(
                '상품 설명',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextField(
                  controller: descriptionController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: '상품 설명을 입력해주세요.',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
