// ignore_for_file: prefer_const_constructors
import 'package:articles_api/articles_api.dart';
import 'package:articles_repository/articles_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockTodosApi extends Mock implements ArticlesApi {}

class FakeArticle extends Fake implements Article {}
void main() {
  // late ArticlesApi api;
  group('ArticlesRepository', () {
    test('can be instantiated', () {
      // expect(ArticlesRepository(articlesApi: api), isNotNull);
    });
  });
}
