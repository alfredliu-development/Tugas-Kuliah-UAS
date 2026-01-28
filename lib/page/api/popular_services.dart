import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:anime_detail/page/list/popular_list.dart';

class PopularServices {
  static const baseUrl = "https://api.jikan.moe/v4";

  Future<List<PopularList>> getPopularAnime() async {
    final response = await http.get(
      Uri.parse("$baseUrl/top/anime?filter=bypopularity&limit=10"),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> list = data["data"];

      return list.take(10).map((e) => PopularList.fromJson(e)).toList();
    }

    throw Exception("Error Get Anime Popular");
  }
}