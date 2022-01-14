import 'dart:async';
import 'dart:convert';

import 'package:articles_api/articles_api.dart';
import 'package:rxdart/subjects.dart';

/// {@template local_storage_articles_api}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class LocalStorageArticlesApi extends ArticlesApi {
  /// {@macro local_storage_articles_api}
  const LocalStorageArticlesApi();

  final _articleStreamController = BehaviorSubject<List<Article>>.seeded(const []);

  void _init() {
    final articlesJson = _getValue(kTodosCollectionKey);
    if (articlesJson != null) {
      final todos = List<Map>.from(json.decode(articlesJson) as List)
          .map((jsonMap) => Article.fromJson(Map<String, dynamic>.from(jsonMap)))
          .toList();
      _articleStreamController.add(todos);
    } else {
      _articleStreamController.add(const []);
    }
  }

  @override
  Stream<List<Article>> getTodos() => _articleStreamController.asBroadcastStream();
}
