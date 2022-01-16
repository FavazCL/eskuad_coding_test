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

  final _articleStreamController = 
  BehaviorSubject<List<Article>>.seeded(const []);

  void _init() async {
    final directory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    final box = await Hive.openBox<Article>('article');
    return print(box.values);
    /*
    final articlesJson = _getValue(kTodosCollectionKey);
    if (articlesJson != null) {
      final todos = List<Map>.from(json.decode(articlesJson) as List)
          .map((jsonMap) => Article.fromJson(Map<String, dynamic>.from(jsonMap)))
          .toList();
      _articleStreamController.add(todos);
    } else {
      _articleStreamController.add(const []);
    }*/
  }

  @override
  Stream<List<Article>> getArticles() => 
    _articleStreamController.asBroadcastStream();
}
