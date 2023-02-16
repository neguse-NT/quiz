// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recentlyquize/constants/article_data.dart';

class Article {
  int articleId;
  bool isBookMarked;
  String? author;
  String? description;
  bool isFavorite;
  String? title;
  String? imgUrl;
  int? likeCount;
  int? readCount;
  String? authorFirstName;
  String? authorLastName;
  String? body;
  String? category;
  String? readingDuration;
  String? createDate;
  final now = DateTime.now();
  Article({
    required this.articleId,
    required this.isBookMarked,
    this.author,
    this.description,
    required this.isFavorite,
    this.title,
    this.imgUrl,
    this.likeCount,
    this.readCount,
    this.authorFirstName,
    this.authorLastName,
    this.body,
    this.category,
    this.createDate,
    this.readingDuration,
  });

  Article copyWith({
    int? articleId,
    bool? isBookMarked,
    String? author,
    String? description,
    bool? isFavorite,
    String? title,
    String? imgUrl,
    int? likeCount,
    int? readCount,
    String? authorFirstName,
    String? authorLastName,
    String? body,
    String? category,
    String? readingDuration,
    String? createDate,
  }) {
    return Article(
      articleId: articleId ?? this.articleId,
      isBookMarked: isBookMarked ?? this.isBookMarked,
      author: author ?? this.author,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      title: title ?? this.title,
      imgUrl: imgUrl ?? this.imgUrl,
      likeCount: likeCount ?? this.likeCount,
      readCount: readCount ?? this.readCount,
      authorFirstName: authorFirstName ?? this.authorFirstName,
      authorLastName: authorLastName ?? this.authorLastName,
      body: body ?? this.body,
      category: category ?? this.category,
      readingDuration: readingDuration ?? this.readingDuration,
      createDate: createDate ?? this.createDate,
    );
  }

  @override
  String toString() => 'Film(id:$articleId,'
      'title:$title,'
      'description:$description,'
      'isFavorite:$isBookMarked)';

  @override
  bool operator ==(covariant Article other) =>
      articleId == other.articleId && isBookMarked == other.isBookMarked;

  @override
  int get hashCode => Object.hashAll(
        [
          articleId,
          isBookMarked,
        ],
      );
}

class ArticleNotifier extends StateNotifier<List<Article>> {
  ArticleNotifier() : super(articles);

  void update(Article article, bool isBookMarked, {bool? isFavorite}) {
    state = state
        .map((thisarticle) => thisarticle.articleId == article.articleId
            ? thisarticle.copyWith(
                isBookMarked: isBookMarked,
                isFavorite: isFavorite ,
              )
            : thisarticle)
        .toList();
  }
}
