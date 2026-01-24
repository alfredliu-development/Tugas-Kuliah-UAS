class PopularList {
  String title;
  String imageTitle;
  String detail;

  PopularList({
    required this.title,
    required this.imageTitle,
    required this.detail,
  });
}

var popularList = [
  PopularList(
    title: "One Piece",
    imageTitle: "assets/image/poster/one_piece.jpg",
    detail: "A story about pirates searching for the ultimate treasure.",
  ),
];