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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Your Anime Recomendation",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Opti",
                ),
              ),

              Divider(
                height: 10,
                color: Colors.black45,
                radius: BorderRadius.circular(10),
                thickness: 2,
                endIndent: 20,
              ),

              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                ),
              )
            ],
          ),
        )
      )
    );
  }
}