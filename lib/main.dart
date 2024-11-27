import 'package:flutter/material.dart';
import 'package:shoppingmall/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Team Shopping Mall",
      theme: ThemeData(
        // 전체 적용 폰트: 노토산스KR
        fontFamily: 'NotoSansKR',

        // 앱바 테마 설정
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white, 
          elevation: 5, 
          iconTheme: IconThemeData(
            color: Colors.blue,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black87, 
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        // 앱바색상에 블루색상이 들어가는 것을 방지하기 위해 기본 색상 설정
        primaryColor: Colors.white, // 기본 색상 설정
        useMaterial3: false, // Material 3 비활성화
      ),
      home: HomePage(), // MainPage 대신 HomePage를 바로 불러오도록 수정
    );
  }
}
