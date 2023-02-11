import 'package:flutter/material.dart';
import 'package:recentlyquize/screens/recent_articles.dart';

class AllRecentArticles extends StatelessWidget {
  const AllRecentArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Articles'),
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
          SizedBox(height: 500, child: RecentlyArticles()),
        ],
      ),
    );
  }
}
