// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yt_shorts/pages/short_page.dart';
// import 'package:yt_shorts/pages/temp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        
      ),
      routes: {
        ShortPage.id:(context) => ShortPage(),
        // Temp.id:(context) => Temp(mediaUrl:  "https://cdn.gro.care/ec12312256ad_1683524903074.mp4",),
      },
      initialRoute: ShortPage.id ,
      // initialRoute: ShortPage.id,
    );
  }
}
