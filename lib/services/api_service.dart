import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/webtoon_model.dart';

class Apiservice {
  static String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static String today = "today";

  //http응답을 보내 받은 response를 리스트형태로 가공하여 return
  static Future<List<webtoon_model>> getTodaysToons() async {
    List<webtoon_model> webtoonInstances = [];

    //request 보내기
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    //response에 따라 결과 return 또는 return 값 생성
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
