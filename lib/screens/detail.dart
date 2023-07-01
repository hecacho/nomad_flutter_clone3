import 'package:flutter/material.dart';
import 'package:flutter_clone3/models/webtoon_model.dart';
import '../customWidgets/my_widgets.dart';

class DetailScreen extends StatelessWidget {
  webtoon_model webtoon;
  DetailScreen({super.key, required this.webtoon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3), // 색상
              spreadRadius: 5, // 스프레드 크기
              blurRadius: 10, // 블러 크기
              offset: const Offset(10, 8), // X, Y 이동 거리
            ),
          ],
        ),
        child: Image.network(
          webtoon.thumb,
          width: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
