// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recentlyquize/screens/article_detail.dart';
import '../constants/article_data.dart';
import '../models/recent_article_model.dart';

final articleProvider = Provider<List<Article>>((ref) {
  return articles;
});
//all articles
final allArticleProvider =
    StateNotifierProvider<ArticleNotifier, List<Article>>(
  (_) => ArticleNotifier(),
);

class RecentlyArticles extends ConsumerWidget {
  final AlwaysAliveProviderBase<Iterable<Article>> provider;
  const RecentlyArticles({super.key, required this.provider});
  //bool isBookMarked = true;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(provider);
    return Scaffold(
      body: SizedBox(
        height: 600,
        width: double.infinity,
        child: ListView.builder(
          // scrollDirection: Axis.horizontal,
          itemCount: articles.length,
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
            final isFavoriteIcon = article.isFavorite
                ? SvgPicture.asset(
                    "assets/favorite.svg",
                    width: 20,
                    height: 20,
                    // color: Colors.blueGrey,
                  )
                : SvgPicture.asset(
                    "assets/favorite.svg",
                    width: 20,
                    height: 20,
                    //color: Colors.blueGrey,
                  );
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
                      padding: const EdgeInsets.only(left: 12, right: 10),
                      child: SizedBox(
                        height: 50,
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
                              width: 15,
                            ),
                            IconButton(
                                onPressed: () {
                                  //final isFavorite = !article.isFavorite;
                                  //final isBookMarked = !article.isBookMarked;
                                  // ref.read(allArticleProvider.notifier).update(
                                  //       article,
                                  //       isBookMarked,
                                  //     );
                                },
                                icon: isFavoriteIcon),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(article.likeCount.toString()),
                            const SizedBox(
                              width: 12,
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
                    ),
                    leading: Image.network(
                      article.imgUrl ?? '',
                      width: 80,
                      height: 84,
                    ),
                  ),
                ),
                Positioned(
                  child: SizedBox(
                    height: 30,
                    child: Align(
                      alignment: const Alignment(0.9, 0.9),
                      child: IconButton(
                        onPressed: () {
                          final isBookMarked = !article.isBookMarked;
                          ref.read(allArticleProvider.notifier).update(
                                article,
                                isBookMarked,
                              );
                        },
                        icon: isBookMarkedIcon,
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
