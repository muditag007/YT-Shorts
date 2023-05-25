// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:yt_shorts/pages/page_preview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Icon(Icons.menu),
            SizedBox(
              width: 20,
            ),
            Text(
              "PocketUp",
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return PagePreview(
            index.toString(),
          );
        },
      ),
    );
  }
}
