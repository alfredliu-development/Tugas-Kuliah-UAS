class PopularList {
  String title;
  String imageTitle;
  String detail;
  dynamic rating;
  List<String> genres;
  String gender;

  PopularList({
    required this.title,
    required this.imageTitle,
    required this.rating,
    required this.detail,
    required this.genres,
    required this.gender,
  });

  factory PopularList.fromJson(Map<String, dynamic> json) {
    List<String> allGenres = [];

    void addNames(dynamic list) {
      if (list is List) {
        for (var item in list) {
          if (item is Map && item['name'] != null) {
            allGenres.add(item['name'].toString());
          }
        }
      }
    }

    addNames(json['genres']);
    addNames(json['themes']);
    addNames(json['demographics']);

    return PopularList(
      title: json['title']?.toString() ?? '',
      imageTitle: json['images']?['jpg']?['image_url']?.toString() ?? '',
      rating: json['score'] ?? 0.0,
      detail: json['synopsis']?.toString() ?? '',
      genres: allGenres,
      gender: allGenres.isNotEmpty ? allGenres.first : 'Unknown',
    );
  }
}
