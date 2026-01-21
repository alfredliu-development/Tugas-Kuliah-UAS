import 'package:anime_detail/page/menu_bar/bottom_navigator_page.dart';
import 'package:anime_detail/page/menu_bar/drawer_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Your Anime",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Decol"
          ),
        ),
      ),

      drawer: DrawerPage(),
      bottomNavigationBar: BottomNavigatorPage(index: 0),
    );
  }
}