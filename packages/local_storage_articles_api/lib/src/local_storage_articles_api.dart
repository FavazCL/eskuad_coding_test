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
    _init();
  }

  List<Article> _articles = <Article>[];
  final _articleStreamController = 
  BehaviorSubject<List<Article>>.seeded(const []);

  void _init() async {
    final directory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    final box = await Hive.openBox<Article>('article');
    
    if (box.isNotEmpty) {
      _articles = box.values.toList();
      _articleStreamController.add(_articles);
    } else {
      _articleStreamController.add(const []);
    }
  }

  void saveArticles(Article article) async {
    print('SAVE: ARTCLE ${article.toJson()}');

    final box = await Hive.openBox<Article>('article');
    await box.add(article);
    print('done');
  }

  @override
  Stream<List<Article>> getArticles({Map<String, dynamic>? queryParams}) => 
    _articleStreamController.asBroadcastStream();
}
