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

              SizedBox(
                height: 360,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final popular = popularList[index];
                    return InkWell(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: 200,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 5,
                          margin: EdgeInsets.symmetric(
                            horizontal: 23.6,
                            vertical: 20.4,
                          ),
                
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  popular.imageTitle,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                                
                              Padding(
                                padding: EdgeInsets.all(25),
                                child: Text(
                                  popular.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "Tokumin",
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                
                      onTap: () {},
                    );
                  },
                
                  itemCount: popularList.length,
                ),
              ),

              SizedBox(height: 50),
            ],
          ),
        )
      )
    );
  }
}