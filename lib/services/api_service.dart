import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/webtoon_model.dart';

class Apiservice {
  static String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static String today = "today";

  static Future<List<webtoon_model>> getTodaysToons() async {
    List<webtoon_model> webtoonInstances = [];

    //request 보내기
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    //response에 따라 결과 return 또는 에러처리
    if (response.statusCode == 200) {
      final List webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(webtoon_model(
            id: webtoon['id'],
            title: webtoon['title'],
            thumb: webtoon['thumb']));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
