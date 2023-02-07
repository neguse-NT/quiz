import 'package:flutter/material.dart';

class ArticleCategory extends StatelessWidget {
  const ArticleCategory({super.key, this.articleName, this.articelIcon});
  final String? articleName;
  final IconData? articelIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 200,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.black12,
          minimumSize: const Size(96, 45),
        ),
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              articelIcon!,
              size: 20,
            ),
            Text(
              articleName!,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
