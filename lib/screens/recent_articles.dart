import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recentlyquize/screens/article_detail.dart';

import '../constants/article_data.dart';
import '../models/recent_article_model.dart';

class RecentlyArticles extends StatelessWidget {
  RecentlyArticles({
    super.key,
  });
  bool isBookMarked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 500,
        width: double.infinity,
        child: ListView.builder(
          // scrollDirection: Axis.horizontal,
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
                Positioned(
                  child: Container(
                    height: 30,
                    child: Align(
                      alignment: Alignment(0.9, 0.9),
                      child: isBookMarked
                          ? SvgPicture.asset(
                              "assets/bookmark.svg",
                              width: 20,
                              height: 20,
                              // color: Colors.blueGrey,
                            )
                          : SvgPicture.asset(
                              "assets/bookmarked.svg",
                              width: 20,
                              height: 20,
                              //color: Colors.blueGrey,
                            ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
