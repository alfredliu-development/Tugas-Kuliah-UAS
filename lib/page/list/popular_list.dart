class PopularList {
  String title;
  String imageTitle;
  String detail;
  dynamic rating;

  PopularList({
    required this.title,
    required this.imageTitle,
    required this.rating,
    required this.detail,
  });

  factory PopularList.fromJson(Map<String, dynamic> json) {
    return PopularList(
      title: json['title'] ?? '',
      imageTitle: json['images']?['jpg']?['image_url'] ?? '',
      rating: json['score'] ?? 0.0,
      detail: json['synopsis'] ?? '',
    );
  }
}