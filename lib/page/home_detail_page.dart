import 'package:anime_detail/page/list/popular_list.dart';
import 'package:flutter/material.dart';

class HomeDetailPage extends StatefulWidget {
  final PopularList popularList;
  const HomeDetailPage({super.key, required this.popularList});

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.popularList.title,
          style: const TextStyle(
            fontFamily: "Decol",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 21),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(10, 15),
                    ),
                  ],
                ),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: widget.popularList.imageTitle.startsWith('http')
                      ? Image.network(widget.popularList.imageTitle)
                      : Image.asset(widget.popularList.imageTitle),
                ),
              ),
            ),

            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 255, 215, 0),
                  size: 55,
                  shadows: [
                    Shadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, 5.0),
                    ),
                  ],
                ),

                SizedBox(width: 10),
                Text(
                  "${widget.popularList.rating}/10.0",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Tokumin",
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 45
              ),
              
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 30
              ),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.white30,
                  width: 1.5,
                ),

                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white38,
                    Colors.white10,
                  ],
                ),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),

              height: 400,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Detail",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: "HarunoUmi",
                        color: Colors.black,
                      ),
                    ),
                
                    SizedBox(height: 15),
                    Text(
                      widget.popularList.detail,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.6,
                        fontFamily: "Tokumin",
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}