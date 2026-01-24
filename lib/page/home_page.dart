import 'package:anime_detail/page/list/popular_list.dart';
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
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Opti",
                ),
              ),

              Divider(
                height: 50,
                color: Colors.black45,
                radius: BorderRadius.circular(10),
                thickness: 2,
                endIndent: 20,
              ),

              SizedBox(height: 10),
              ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: ScrollController(
                  initialScrollOffset: 1,
                ),

                itemBuilder: (context, index) {
                  final PopularList popular = popularList[index];
                  return InkWell(
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              popular.imageTitle,
                              width: 150,
                              height: 220,
                              fit: BoxFit.cover,
                            ),
                          ),
                      
                          SizedBox(height: 10),
                          Text(
                            popular.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Tokumin",
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        )
      )
    );
  }
}