import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recentlyquize/common%20widgets/article_category.dart';
import 'package:recentlyquize/main.dart';
import 'package:recentlyquize/screens/popular_article.dart';

import 'article_detail.dart';

class HomeArticle extends StatelessWidget {
  const HomeArticle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Container(
          //   height: 30,
          //   child: Positioned(
          //     child: Align(
          //       alignment: Alignment(0.0, 40.0),
          //       child: IconButton(
          //         onPressed: () {
          //           Navigator.of(context).pop();
          //         },
          //         icon: const Icon(
          //           Icons.arrow_back,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Row(
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
              SizedBox(
                width: 350,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SvgPicture.asset("assets/bookmarked.svg"),
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
                              color: Colors.yellowAccent, fontSize: 20)),
                      TextSpan(
                        text: 'abbee',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      TextSpan(
                          text: '+',
                          style: TextStyle(color: Colors.yellow, fontSize: 20)),
                    ],
                  ),
                ),
              ),
              const Text(
                "Articles",
                style: TextStyle(
                    color: Colors.white, fontSize: 20, letterSpacing: 2.0),
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
                      color: Colors.white, fontSize: 20, letterSpacing: 2.0),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                      color: Colors.yellow, fontSize: 20, letterSpacing: 2.0),
                )
              ],
            ),
          ),

          Container(
            height: 80,
            padding: EdgeInsets.all(8),
            color: Colors.amber,
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
                // Padding(
                //   padding: EdgeInsets.all(8.0),
                //   child: ArticleCategory(
                //     articleName: 'Education',
                //     articelIcon: Icons.book_online_outlined,
                //   ),
                // ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          // alignment is not set
          const Text(
            "Popular",
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr,
            style: TextStyle(
                color: Colors.white, fontSize: 20, letterSpacing: 2.0),
          ),
          const SizedBox(
            height: 15,
          ),
          const PopularArticle(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Recent Articles",
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, letterSpacing: 2.0),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                      color: Colors.yellow, fontSize: 20, letterSpacing: 2.0),
                )
              ],
            ),
          ),
          const RecentlyArticles(),
        ],
      ),
    );
  }
}
