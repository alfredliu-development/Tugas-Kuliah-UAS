import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBar extends StatefulWidget {
  const HomeBar({super.key});

  @override
  State<HomeBar> createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {
  String? name;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Welcome, $name"),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void getName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString("name") ?? "";
    });
  }
}