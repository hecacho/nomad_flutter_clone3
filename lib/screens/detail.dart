import 'package:flutter/material.dart';
import 'package:flutter_clone3/models/webtoon_model.dart';
import '../customWidgets/my_widgets.dart';

class DetailScreen extends StatelessWidget {
  final webtoon_model webtoonData;
  const DetailScreen({super.key, required this.webtoonData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(webtoonData.title),
        body: Column(
          children: [
            Container(
              height: 300,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Flexible(
                    child: WebtoonImageBox(webtoonData: webtoonData),
                  ),
                  Flexible(
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(webtoonData.title),
                          const Text("대충 웹툰에 대한 설명"),
                          const Text("대충 별점"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Center(
                child: Text("에피소드 리스트"),
              ),
            )
          ],
        ));
  }
}
