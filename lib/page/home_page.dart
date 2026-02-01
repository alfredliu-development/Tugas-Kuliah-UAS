import 'package:anime_detail/page/home_detail/popular_detail_page.dart';
import 'package:anime_detail/page/list/popular_list.dart';
import 'package:anime_detail/page/list/recommended_list.dart';
import 'package:anime_detail/page/home_detail/recommend_detail_page.dart';
import 'package:anime_detail/page/menu_bar/bottom_navigator_page.dart';
import 'package:anime_detail/page/menu_bar/drawer_page.dart';
import 'package:anime_detail/page/api/popular_services.dart';
import 'package:anime_detail/page/api/recommended_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey(0),
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
                      return const Center(child: CircularProgressIndicator());
                    } 
                    
                    else if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    } 
                    
                    else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text("No Data"));
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
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        PopularDetailPage(animeData: popular),
                
                                transitionsBuilder:
                                    (
                                      context,
                                      animation,
                                      secondaryAnimation,
                                      child,
                                    ) {
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
                "Recommended Anime",
                style: TextStyle(
                  fontFamily: "Decol",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              Divider(height: 30, color: Colors.black45, thickness: 1),

              FutureBuilder<List<RecommendedList>>(
                future: RecommendedServices().getRecommendedAnime(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  
                  else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  }
                  
                  else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No Data"));
                  }

                  final recommendedList = snapshot.data!;

                  return Column(
                    children: recommendedList.map((anime) {
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),

                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => RecommendDetailPage(animeData: anime),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },

                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    anime.imageTitle,
                                    width: 80,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        anime.title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: "Tokumin",
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),

                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 18,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            "${anime.rating}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 8),
                                      Text(
                                        anime.detail,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
