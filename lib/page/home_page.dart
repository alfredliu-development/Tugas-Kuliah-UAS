import 'package:anime_detail/page/home_detail_page.dart';
import 'package:anime_detail/page/list/popular_list.dart';
import 'package:anime_detail/page/menu_bar/bottom_navigator_page.dart';
import 'package:anime_detail/page/menu_bar/drawer_page.dart';
import 'package:anime_detail/page/api/popular_services.dart';
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
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Decol"),
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
                "Top 10 Most Popular Anime",
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
                child: FutureBuilder<List<PopularList>>(
                  future: PopularServices().getPopularAnime(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator()
                      );
                    }
                    
                    else if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}")
                      );
                    }
                    
                    else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text("No Data")
                      );
                    }

                    final dataAnimePopular = snapshot.data!;

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dataAnimePopular.length,
                      itemBuilder: (context, index) {
                        final popular = dataAnimePopular[index];
                        return InkWell(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            width: 200,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 5,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 23.6,
                                vertical: 20.4,
                              ),

                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Expanded(
                                        child:
                                            popular.imageTitle.startsWith(
                                              'http',
                                            )
                                            ? Image.network(
                                                popular.imageTitle,
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                              )
                                            : Image.asset(
                                                popular.imageTitle,
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                              ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(25),
                                        child: Text(
                                          popular.title,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontFamily: "Tokumin",
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),

                                      decoration: BoxDecoration(
                                        color: index == 0
                                            ? Color.fromARGB(255, 255, 215, 0)
                                            : index == 1
                                            ? Color.fromARGB(255, 131, 137, 150)
                                            : index == 2
                                            ? Color.fromARGB(255, 169, 169, 95)
                                            : Colors.blue[700],
                                            
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black38,
                                            blurRadius: 4,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),

                                      child: Text(
                                        '#${index + 1}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          shadows: [
                                            Shadow(
                                              color: Colors.black45,
                                              blurRadius: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => HomeDetailPage(popularList: popular),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: 50),
              Text(
                "Anime Day",
                style: TextStyle(
                  fontFamily: "Decol",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}