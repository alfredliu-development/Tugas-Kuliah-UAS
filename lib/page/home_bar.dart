import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeBar extends StatefulWidget {
  String? name;
  HomeBar({super.key, this.name});

  @override
  State<HomeBar> createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}