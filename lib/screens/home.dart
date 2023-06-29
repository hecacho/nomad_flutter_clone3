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
            return ListView.builder(
              itemCount: snapshot.data!.length,
              //scrollDirection: Axis.horizontal,
              itemBuilder:(context, index){
                return Text(snapshot.data![index].title);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator( 
                strokeWidth : 7,
              ),
            );
          }
        },
      ),
    );
  }
}
