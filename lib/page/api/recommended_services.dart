import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:anime_detail/page/list/popular_list.dart';

class RecommendedServices {
  static const baseUrl = "https://api.jikan.moe/v4";

  Future<List<PopularList>> getRecommendedAnime() async {
    final response = await http.get(
      Uri.parse("$baseUrl/top/anime?filter=favorite&limit=10"),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> list = data["data"];

      return list.map((e) => PopularList.fromJson(e)).toList();
    }

    throw Exception("Error Get Recommended Anime");
  }
}
