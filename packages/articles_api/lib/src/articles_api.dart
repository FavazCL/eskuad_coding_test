import 'package:articles_api/articles_api.dart';

/// {@template articles_api}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
abstract class ArticlesApi {
  /// {@macro articles_api}
  const ArticlesApi();

  /// Provides a [Stream] of all articles.
  Stream<List<Article>> getArticles();
}
