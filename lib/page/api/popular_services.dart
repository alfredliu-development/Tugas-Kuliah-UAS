import 'dart:convert';

import 'package:http/http.dart' as http;

class PopularServices {
  static const baseUrl = "https://api.jikan.moe/v4";

  Future<List<dynamic>> getPopularAnime() async {
    final response = await http.get(
      Uri.parse("$baseUrl/top/anime?filter=bypopularity")
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data["data"];
    }
    
    throw Exception("Error Get Anime Popular");
  }
}