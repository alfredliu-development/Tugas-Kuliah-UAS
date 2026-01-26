import 'package:anime_detail/page/home_page.dart';
import 'package:anime_detail/page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigatorPage extends StatefulWidget {
  final int index;
  const BottomNavigatorPage({super.key, required this.index});

  @override
  State<BottomNavigatorPage> createState() => _BottomNavigatorPageState();
}

class _BottomNavigatorPageState extends State<BottomNavigatorPage> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20)
      ),

      child: Container(
        color: Color.fromARGB(255, 1, 183, 237),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 15
          ),

          child: GNav(
            onTabChange: (value) => pageChanges(value),
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            gap: 8,
            tabBackgroundColor: Color.fromARGB(255, 102, 191, 255),
            color: Colors.black38,
            activeColor: Colors.white,
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "HarunoUmi",
              fontSize: 13
            ),

            tabBorderRadius: 10,
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),

              GButton(
                icon: Icons.search,
                text: "Search",
              ),

              GButton(
                icon: Icons.emoji_events,
                text: "Top Anime",
              ),

              GButton(
                icon: Icons.book,
                text: "Your Anime List",
              ),
            ],
          ),
        ),
      ),
    );
  }

  void pageChanges(int value) {
    if (value == widget.index) return;
    Widget pages = HomePage();
    
    switch(value) {
      case 0:
        pages = HomePage();
        break;

      case 1:
        pages = SearchPage();
        break;
    }

    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => pages,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      )
    );
  }
}