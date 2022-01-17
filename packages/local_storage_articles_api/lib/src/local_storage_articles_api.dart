import 'dart:async';

import 'package:articles_api/articles_api.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:rxdart/subjects.dart';

/// {@template local_storage_articles_api}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class LocalStorageArticlesApi extends ArticlesApi {
  /// {@macro local_storage_articles_api}
  LocalStorageArticlesApi() {
    // _init();
  }

  List<Article> _articles = <Article>[];
  final _articleStreamController =
      BehaviorSubject<List<Article>>.seeded(const []);

  Future<void> _init() async {
    final directory = await path_provider.getApplicationDocumentsDirectory();
    Hive
      ..init(directory.path)
      ..registerAdapter(ArticleAdapter());

    final box = await Hive.openBox<Article>('article');

    if (box.isNotEmpty) {
      _articles = box.values.toList();
      _articleStreamController.add(_articles);
    } else {
      _articleStreamController.add(const []);
    }
  }

  /// Save articles in the local storage
  Future<void> saveArticles(List<Article> articles) async {
    final directory = await path_provider.getApplicationDocumentsDirectory();
    Hive
      ..init(directory.path)
      ..registerAdapter(ArticleAdapter());
    final box = await Hive.openBox<Article>('article');

    for (final article in articles) {
      final item = box.get(article.id, defaultValue: article);
      print('item: $item');
      print('item isEmpty?: ${item == null}');
      if (item == null) {
       await box.add(article);
      }
    }

    print('done: ${articles}');
  }

  // TODO: REPLACE THIS METHOD FOR OTHER, HAY QUE AGREGAR UNO DE BOX :D
  @override
  Future<List<Article>> getArticles({
    Map<String, dynamic>? queryParams,
  }) async {
     final directory = await path_provider.getApplicationDocumentsDirectory();
    Hive
      ..init(directory.path)
      ..registerAdapter(ArticleAdapter());
    final box = await Hive.openBox<Article>('article');

    _articles = box.values.toList();
    print(_articles);
    return _articles;
  }
      // _articles;
}
