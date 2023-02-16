import 'package:flutter/material.dart';
import 'package:recentlyquize/models/recent_article_model.dart';

// ignore: must_be_immutable
class ArticleDetails extends StatelessWidget {
  Article? article;
  ArticleDetails({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Details'),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    article?.imgUrl ?? "",
                    height: 500,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    left: 55.0,
                    height: 60,
                    //width: 1606.85,
                    bottom: 30,
                    child: Text(
                      article?.title ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.transparent,
                // color: Colors.black38,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    children: [
                      CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.transparent,
                          child: buildImage()),
                      const SizedBox(
                        width: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            Text(article?.authorFirstName ?? ''),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(article?.createDate ?? ''),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time_filled,
                          ),
                          Text(article?.readingDuration.toString() ?? ''),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  article?.description ?? '',
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

ClipOval buildImage() {
  return ClipOval(
    child: Image.network(
      'https://media.istockphoto.com/photos/excited-woman-wearing-rainbow-cardigan-picture-id1327495437',
    ),
  );
}
//"${article?.authorFirstName ?? ''}  ${article?.authorLastName ?? ''}"