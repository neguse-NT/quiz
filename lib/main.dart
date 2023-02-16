import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recentlyquize/screens/home_article.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
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
