import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/webtoon_model.dart';

class Apiservice{
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons() async{
    List<webtoon_model> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    final List webtoons = jsonDecode(response.body);
    for (var webtoon in webtoons) {
      webtoonInstances.add(webtoon_model(id: webtoon['id'], title: webtoon['title'], thumb: webtoon['thumb']));
    }
    print(webtoonInstances[3].title);
  }
}