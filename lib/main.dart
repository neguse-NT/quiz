import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recentlyquize/constants/article_data.dart';
import 'package:recentlyquize/models/recent_article_model.dart';
import 'package:recentlyquize/screens/article_detail.dart';
import 'package:recentlyquize/screens/home_article.dart';

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

class RecentlyArticles extends StatelessWidget {
  const RecentlyArticles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Recently articles'),
        // ),
        body: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            Article article = articles[index];
            return Stack(
              children: [
                Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ArticleDetails(article: article);
                      }));
                    },
                    title: Padding(
                      padding:
                          const EdgeInsets.only(bottom: 12, left: 12, top: 12),
                      child: Text(article.title ?? ''),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/author.svg",
                            width: 15,
                            height: 15,
                            color: Colors.blueGrey,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(article.author ?? ''),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(Icons.favorite_border),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(article.likeCount.toString()),
                          const SizedBox(
                            width: 20,
                          ),
                          SvgPicture.asset(
                            "assets/viewcount.svg",
                            width: 20,
                            height: 16,
                            color: Colors.blueGrey,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(article.readCount.toString()),
                        ],
                      ),
                    ),
                    leading: Image.network(
                      article.imgUrl ?? '',
                      width: 80,
                      height: 84,
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  child: Positioned(
                    child: Align(
                      alignment: Alignment(0.9, 0.9),
                      child: SvgPicture.asset(
                        "assets/bookmarked.svg",
                        width: 20,
                        height: 20,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
