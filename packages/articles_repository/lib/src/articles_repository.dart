import 'package:articles_api/articles_api.dart';
import 'package:local_storage_articles_api/local_storage_articles_api.dart';

/// {@template articles_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class ArticlesRepository {
  /// {@macro articles_repository}
  const ArticlesRepository({
    required ArticlesApi articlesApi,
    required LocalStorageArticlesApi localStorageArticlesApi,
    
  })  : _articlesApi = articlesApi,
        _localStorageArticlesApi = localStorageArticlesApi;

  final ArticlesApi _articlesApi;
  final LocalStorageArticlesApi _localStorageArticlesApi;

  /// Provides a [Stream] of all articles.
  Stream<List<Article>> getArticles() => _articlesApi.getArticles();
}
