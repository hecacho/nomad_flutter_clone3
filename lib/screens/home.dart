import 'package:flutter/material.dart';
import '../models/webtoon_model.dart';
import '../services/api_service.dart';

class Home extends StatelessWidget {
  final Future<List<webtoon_model>> webtoons = Apiservice.getTodaysToons();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData == true) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: MakeWebtoonList(snapshot)),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 7,
              ),
            );
          }
        },
      ),
    );
  }

  ListView MakeWebtoonList(AsyncSnapshot<List<webtoon_model>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      //scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
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
                  snapshot.data![index].thumb,
                  width: 200,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                snapshot.data![index].title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 15),
    );
  }
}

//flutter run -d chrome --web-renderer html
