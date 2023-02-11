import 'package:flutter/material.dart';
import 'package:recentlyquize/screens/home_article.dart';
import 'package:recentlyquize/screens/recent_articles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // var article;
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: HomeArticle(),
    );
  }
}
