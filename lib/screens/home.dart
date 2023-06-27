import 'package:flutter/material.dart';
import '../models/webtoon_model.dart';
import '../services/api_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //properties
  List<webtoon_model> webtoons = [];
  bool isLoading = true;

  //methods
  void initTodaysToons() async{
    webtoons = await Apiservice.getTodaysToons();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initTodaysToons();
  }

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    print(isLoading);
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
    );
  }
}
