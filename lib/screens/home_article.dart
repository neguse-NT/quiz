import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recentlyquize/screens/all_article.dart';
import 'package:recentlyquize/screens/article_detail.dart';
import 'package:recentlyquize/screens/book_mark.dart' hide allArticleProvider;
import 'package:recentlyquize/screens/popular_article.dart'
    hide allArticleProvider;

import 'package:recentlyquize/screens/recent_articles.dart';

import '../common widgets/article_category.dart';

// ignore: must_be_immutable
class HomeArticle extends StatelessWidget {
  HomeArticle({super.key});
  bool isFabVisible = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SafeArea(
                    child: SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            iconSize: 20,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 180,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return const BookMark();
                                  }));
                                },
                                child:
                                    SvgPicture.asset("assets/bookmarked.svg")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.transparent,
                                child: buildImage()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'K',
                                style: TextStyle(
                                    color: Colors.amberAccent, fontSize: 20)),
                            TextSpan(
                              text: 'abbee',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            TextSpan(
                                text: '+',
                                style: TextStyle(
                                    color: Colors.yellow, fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                    const Text(
                      "Articles",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 2.0),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Category",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 2.0),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 20,
                            letterSpacing: 2.0),
                      )
                    ],
                  ),
                ),

                Container(
                  height: 80,
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ArticleCategory(
                          articleName: 'Education',
                          articelIcon: Icons.book_online_outlined,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ArticleCategory(
                          articleName: 'Health',
                          articelIcon: Icons.healing_outlined,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ArticleCategory(
                          articleName: 'Technology',
                          articelIcon: Icons.book_online_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // alignment is not set
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Popular",
                    style: TextStyle(
                        color: Colors.white, fontSize: 20, letterSpacing: 2.0),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                PopularArticle(
                  provider: allArticleProvider,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Recent Articles",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 2.0),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const AllRecentArticles();
                          }));
                        },
                        child: const Text(
                          "View All",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 20,
                              letterSpacing: 2.0),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(
                    height: 500,
                    child: RecentlyArticles(
                      provider: allArticleProvider,
                    )),
              ],
            ),
          ),
        ),
        floatingActionButton: isFabVisible
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    backgroundColor: Colors.amber,
                    onPressed: () {},
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
