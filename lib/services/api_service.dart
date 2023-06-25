import 'dart:convert';

import 'package:http/http.dart' as http;

class Apiservice{
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons() async{
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    final List webtoons = jsonDecode(response.body);
    for (var webtoon in webtoons) {
      print(webtoon);
    }
  }
}