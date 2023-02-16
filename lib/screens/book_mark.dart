import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recentlyquize/screens/recent_articles.dart';

import '../models/recent_article_model.dart';

enum bookmarkStatus {
  all,
  bookmarked,
  notBookmarked,
}

//bookmarked status
final bookmarkedStatusProvider = StateProvider<bookmarkStatus>(
  (_) => bookmarkStatus.all,
);
//all articles
final allArticleProvider =
    StateNotifierProvider<ArticleNotifier, List<Article>>(
  (_) => ArticleNotifier(),
);
//bookmark articles
final bookmarkArticleProvider =
    Provider<Iterable<Article>>((ref) => ref.watch(allArticleProvider).where(
          (article) => article.isBookMarked,
        ));
//not bookmark articles
final notbookmarkArticleProvider =
    Provider<Iterable<Article>>((ref) => ref.watch(allArticleProvider).where(
          (article) => !article.isBookMarked,
        ));

class BookMark extends ConsumerWidget {
  const BookMark({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All BookMark'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Consumer(builder: ((context, ref, child) {
            final bookmarked = ref.watch(bookmarkedStatusProvider);

            if (bookmarked == bookmarkStatus.bookmarked) {
              return SizedBox(
                height: 500,
                child: RecentlyArticles(
                  provider: allArticleProvider,
                ),
              );
            } else {}
            return SizedBox(
                height: 500,
                child: RecentlyArticles(provider: allArticleProvider));
          }))
          // SizedBox(
          //     height: 500,
          //     child: ,
          //   ),
        ],
      ),
    );
  }
}
