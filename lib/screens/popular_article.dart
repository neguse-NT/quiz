import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recentlyquize/constants/article_data.dart';

import '../models/recent_article_model.dart';

class PopularArticle extends StatelessWidget {
  const PopularArticle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          // color: Colors.black,
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: articles.length,
            separatorBuilder: (_, index) => const SizedBox(
              width: 15,
            ),
            itemBuilder: (context, index) {
              Article article = articles[index];
              return Card(
                color: Colors.black,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(children: [
                      Image.network(
                        article.imgUrl ?? "",
                        height: 150,
                        width: 268,
                        fit: BoxFit.fill,
                      ),
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 230, top: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SvgPicture.asset(
                                  "assets/bookmark.svg",
                                  width: 20,
                                  height: 20,
                                  //color: Colors.blueGrey,
                                ),
                              ]),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      article.title ?? '',
                      softWrap: true,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
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
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
