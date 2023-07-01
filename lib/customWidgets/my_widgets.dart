import 'package:flutter/material.dart';
import 'package:flutter_clone3/models/webtoon_model.dart';

PreferredSizeWidget myAppBar() {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 2,
    title: Text(
      "오늘의 웹툰",
      style: TextStyle(
        color: Colors.green.shade600,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

class WebtoonContainer extends StatelessWidget {
  final webtoon_model webtoonInfo;

  const WebtoonContainer({
    super.key,
    required this.webtoonInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3), // 색상
                  spreadRadius: 5, // 스프레드 크기
                  blurRadius: 10, // 블러 크기
                  offset: const Offset(10, 8), // X, Y 이동 거리
                ),
              ],
            ),
            child: Image.network(
              webtoonInfo.thumb,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            webtoonInfo.title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
