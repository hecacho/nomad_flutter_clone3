import 'package:flutter/material.dart';
import 'package:flutter_clone3/models/webtoon_model.dart';
import 'package:flutter_clone3/screens/detail.dart';

PreferredSizeWidget myAppBar(String title) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 2,
    title: Text(
      title,
      style: TextStyle(
        color: Colors.green.shade600,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

class WebtoonContainer extends StatelessWidget {
  final webtoon_model webtoonData;

  const WebtoonContainer({
    super.key,
    required this.webtoonData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => DetailScreen(webtoonData: webtoonData,),
    ),
        );
      },
      child: Column(
        children: [
          WebtoonImageBox(webtoonData: webtoonData),
          const SizedBox(
            height: 20,
          ),
          Text(
            webtoonData.title,
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

class WebtoonImageBox extends StatelessWidget {
  const WebtoonImageBox({
    super.key,
    required this.webtoonData,
  });

  final webtoon_model webtoonData;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        webtoonData.thumb,
        width: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}
