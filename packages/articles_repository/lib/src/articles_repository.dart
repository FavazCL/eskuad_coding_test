import 'package:articles_api/articles_api.dart';
import 'package:articles_repository/utils/network_info.dart';
import 'package:local_storage_articles_api/local_storage_articles_api.dart';

/// {@template articles_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class ArticlesRepository {
  /// {@macro articles_repository}
  const ArticlesRepository({
    required ArticlesApi articlesApi,
    required LocalStorageArticlesApi localStorageArticlesApi,
    required NetworkInfo networkInfo,
  })  : _articlesApi = articlesApi,
        _localStorageArticlesApi = localStorageArticlesApi,
        _networkInfo = networkInfo;

  /// Check connectivity
  final NetworkInfo _networkInfo;

  /// Remote Article Api
  final ArticlesApi _articlesApi;

  /// Local Api
  final LocalStorageArticlesApi _localStorageArticlesApi;

  /// Provides a [Stream] of all articles.
  Stream<List<Article>> getArticles() async* {
    if (_networkInfo.isConnected) {
      print('aca');
      final articles = _articlesApi.getArticles();
      await _localStorageArticlesApi.saveArticles(await articles);

      yield* Stream.fromFuture(articles);
    } else {
      final articles = _localStorageArticlesApi.getArticles();
      yield* Stream.fromFuture(articles);
    }
  }
}
