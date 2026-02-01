import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:anime_detail/page/list/search_list.dart';

class SearchServices {
  static const baseUrl = "https://api.jikan.moe/v4";

  Future<List<SearchList>> getSearchAnime(String query) async {
    final response = await http.get(Uri.parse("$baseUrl/anime?q=$query"));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> list = data["data"];

      return list.map((e) => SearchList.fromJson(e)).toList();
    }

    throw Exception("Error Get Search Anime");
  }
}
