import 'package:anime_detail/page/list/recommended_list.dart';
import 'package:flutter/material.dart';

class RecommendDetailPage extends StatefulWidget {
  final RecommendedList animeData;
  const RecommendDetailPage({super.key, required this.animeData});

  @override
  State<RecommendDetailPage> createState() => _RecommendDetailPageState();
}

class _RecommendDetailPageState extends State<RecommendDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.animeData.title,
          style: TextStyle(
            fontFamily: "Opti",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}