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
      appBar: myAppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: FutureBuilder(
              future: webtoons,
              builder: (context, snapshot) {
                if (snapshot.hasData == true) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return WebtoonContainer(webtoonInfo: snapshot.data![index],);
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
    );
  }
}


