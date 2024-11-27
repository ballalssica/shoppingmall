import 'package:flutter/material.dart';

class RegistrationButton extends StatelessWidget {
  final VoidCallback onPressed; // 버튼 클릭 시 실행할 함수

  const RegistrationButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 95,
      child: OutlinedButton(
        onPressed: onPressed, // 전달받은 함수 실행
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
