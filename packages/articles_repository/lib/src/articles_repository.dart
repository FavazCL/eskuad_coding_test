import 'package:articles_api/articles_api.dart';

/// {@template articles_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class ArticlesRepository {
  /// {@macro articles_repository}
  const ArticlesRepository({
    required ArticlesApi articlesApi,
  }) : _articlesApi = articlesApi;

  final ArticlesApi _articlesApi;

  /// Provides a [Stream] of all articles.
  Stream<List<Article>> getArticles() => _articlesApi.getArticles();
}
