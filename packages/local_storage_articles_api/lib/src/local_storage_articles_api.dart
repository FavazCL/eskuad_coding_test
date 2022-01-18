import 'dart:async';

import 'package:articles_api/articles_api.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

/// {@template local_storage_articles_api}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class LocalStorageArticlesApi extends ArticlesApi {
  /// {@macro local_storage_articles_api}
  LocalStorageArticlesApi() {
    _initHive();
  }

  /// Initialization of Hive
  Future<void> _initHive() async {
    final directory = await path_provider.getApplicationDocumentsDirectory();
    Hive
      ..init(directory.path)
      ..registerAdapter(ArticleAdapter());
  }

  /// Save articles in the Local Storage
  Future<void> saveArticles(List<Article> articles) async {
    final box = await Hive.openBox<Article>('article');

    if (box.values.isEmpty) {
      for (final article in articles) {
        await box.add(article);
      }
    }
  }

  @override
  Future<List<Article>> getArticles({
    Map<String, dynamic>? queryParams,
  }) async {
    final box = await Hive.openBox<Article>('article');

    return box.values.toList();
  }
}
