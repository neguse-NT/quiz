import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recentlyquize/constants/article_data.dart';
import 'package:recentlyquize/screens/article_detail.dart';

import '../models/recent_article_model.dart';

final articleProvider = Provider<List<Article>>((ref) {
  return articles;
});
//all articles
final allArticleProvider =
    StateNotifierProvider<ArticleNotifier, List<Article>>(
  (_) => ArticleNotifier(),
);

class PopularArticle extends ConsumerWidget {
  final AlwaysAliveProviderBase<Iterable<Article>> provider;
  const PopularArticle({super.key, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(provider);
    return SizedBox(
      // color: Colors.black,
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: articles.length,
        separatorBuilder: (_, index) => const SizedBox(
          width: 15,
        ),
        itemBuilder: (context, index) {
          final article = articles.elementAt(index);
          final isBookMarkedIcon = article.isBookMarked
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
                );
          return Card(
            color: Colors.black,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ArticleDetails(article: article);
                      }));
                    },
                    child: Image.network(
                      article.imgUrl ?? "",
                      height: 150,
                      width: 268,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 230, top: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                final isBookMarked = !article.isBookMarked;
                                ref.read(allArticleProvider.notifier).update(
                                      article,
                                      isBookMarked,
                                    );
                              },
                              icon: isBookMarkedIcon,
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
                    SvgPicture.asset(
                      "assets/favorite.svg",
                      width: 20,
                      height: 16,
                      //color: Colors.blueGrey,
                    ),
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
    );
  }
}
