import 'dart:async';
import 'dart:convert';

import 'package:articles_api/articles_api.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/subjects.dart';

/// Exception thrown when getArticles fails.
class ArticleRequestFailure implements Exception {}

/// Exception thrown when articles not found.
class ArticleNotFoundFailure implements Exception {}

/// {@template articles_api}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class ArticlesApi {
  /// {@macro meta_weather_api_client}
  ArticlesApi({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'hn.algolia.com';
  final http.Client _httpClient;

  /// Provides a [Stream] of all todos.
  Future<List<Article>> getArticles({
    Map<String, dynamic>? queryParams,
  }) async {
    final queryParam = {'query': 'mobile'};
    final articleRequest =
        Uri.https(_baseUrl, 'api/v1/search_by_date', queryParam);
    final articleResponse = await _httpClient.get(articleRequest);

    if (articleResponse.statusCode != 200) {
      throw ArticleRequestFailure();
    }

    final bodyJson = jsonDecode(articleResponse.body) as Map<String, dynamic>;

    if (bodyJson.isEmpty) {
      throw ArticleRequestFailure();
    }

    final articleJson = bodyJson['hits'] as List;

    if (articleJson.isEmpty) {
      throw ArticleNotFoundFailure();
    }

    final articles = List<Map>.from(articleJson)
        .map((jsonMap) => Article.fromJson(Map<String, dynamic>.from(jsonMap)))
        .toList();

    return articles;
  }
}
