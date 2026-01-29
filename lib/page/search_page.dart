import 'package:anime_detail/page/menu_bar/bottom_navigator_page.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      
      bottomNavigationBar: BottomNavigatorPage(index: 1),
    );
  }
}