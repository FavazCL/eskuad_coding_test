import 'package:articles_api/articles_api.dart';
import 'package:eskuad_coding_test/home/view/widgets/article_item.dart';
import 'package:flutter/material.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({Key? key, required this.articles}) : super(key: key);
  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        primary: false,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: articles.length,
        itemBuilder: (_, i) {
          final article = articles[i];
    
          return ArticleItem(article: article, index: i);
        },
    );
  }
}
