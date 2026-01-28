class PopularList {
  String title;
  String imageTitle;
  String detail;

  PopularList({
    required this.title,
    required this.imageTitle,
    required this.detail,
  });

  factory PopularList.fromJson(Map<String, dynamic> json) {
    return PopularList(
      title: json['title'] ?? '',
      imageTitle: json['images']['jpg']['image_url'] ?? '',
      detail: json['synopsis'] ?? '',
    );
  }
}