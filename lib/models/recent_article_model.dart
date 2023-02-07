class Article {
  int articleId;
  String? author;
  String? description;
  String? isFavorite;
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
    this.author,
    this.description,
    this.isFavorite,
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
}
