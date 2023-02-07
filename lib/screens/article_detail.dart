import 'package:flutter/material.dart';
import 'package:recentlyquize/models/recent_article_model.dart';

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
                height: 20,
              ),
              Card(
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(article?.authorFirstName ?? ''),
                  ),
                  subtitle: Text(article?.createDate ?? ''),
                  leading: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.transparent,
                      child: buildImage()
                      // Image.network(
                      //     'https://media.istockphoto.com/photos/excited-woman-wearing-rainbow-cardigan-picture-id1327495437'),
                      ),
                  trailing: Text(article?.readingDuration.toString() ?? ''),
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