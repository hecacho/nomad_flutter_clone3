import '../customWidgets/my_widgets.dart';
import 'package:flutter/material.dart';
import '../models/webtoon_model.dart';
import '../services/api_service.dart';

class HomeScreen extends StatelessWidget {
  //API로 웹툰 정보 받아오기
  final Future<List<webtoon_model>> webtoons = Apiservice.getTodaysToons();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar("Springles Toon"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Text(
              "오늘의 웹툰 - 요일별",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black45,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 330,
              child: FutureBuilder(
                future: webtoons,
                builder: (context, snapshot) {
                  if (snapshot.hasData == true) {
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return WebtoonContainer(
                          webtoonData: snapshot.data![index],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 15),
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
            ),
          ],
        ),
      ),
    );
  }
}
