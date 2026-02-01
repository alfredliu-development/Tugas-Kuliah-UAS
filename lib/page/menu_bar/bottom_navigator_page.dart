import 'package:anime_detail/page/home_page.dart';
import 'package:anime_detail/page/menu_bar/drawer_page.dart';
import 'package:anime_detail/page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigatorPage extends StatefulWidget {
  const BottomNavigatorPage({super.key});

  @override
  State<BottomNavigatorPage> createState() => _BottomNavigatorPageState();
}

class _BottomNavigatorPageState extends State<BottomNavigatorPage> {
  int index = 0;
  List<Widget> pages = [
    HomePage(),
    SearchPage(),
  ];

  List<String> pageNames = [
    "Home",
    "Search",
    "Your Anime",
    "Your Favorite",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AnimatedSwitcher(
          duration: Duration(milliseconds: 800),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          
          child: Container(
            key: ValueKey<int>(index),
            child: Text(
              pageNames[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Decol"
              ),
            ),
          ),
        ),
      ),

      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 800),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        
        child: Container(
          key: ValueKey<int>(index),
          child: pages[index]
        ),
      ),
      
      drawer: DrawerPage(),
      bottomNavigationBar: ClipRRect(
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
              gap: 6,
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
                  icon: Icons.book,
                  text: "Your Anime",
                ),
      
                GButton(
                  icon: Icons.favorite,
                  text: "Your Favorite",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void pageChanges(int value) {
    setState(() {
      index = value;
    });
  }
}