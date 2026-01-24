import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: 20,
          vertical: 30
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/image/shizuku-chan_icon.png",
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),

                      SizedBox(width: 30),
                      Text(
                        name == "" ? "Admin" : name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Decol",
                        ),
                      )
                    ],
                  ),

                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ),

            SizedBox(height: 50),
            name == "" ?
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 102, 191, 255),
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10
                ),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),

              child: Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Opti",
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),

              onPressed: () => Navigator.pop(context),
            ) :

            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.settings,
                    size: 30,
                    color: Colors.black54,
                  ),

                  SizedBox(width: 20),
                  Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Tokumin",
                      fontWeight: FontWeight.bold,
                      color: Colors.black54
                    ),
                  )
                ],
              ),

              onTap: () {},
            )
          ],
        ),
      ),
    );
  }

  void getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      name = prefs.getString("name") ?? "";
    });
  }
}