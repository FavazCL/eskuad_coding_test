// ignore_for_file: prefer_const_constructors
import 'package:articles_repository/articles_repository.dart';
import 'package:test/test.dart';

void main() {
  group('ArticlesRepository', () {
    test('can be instantiated', () {
      expect(ArticlesRepository(), isNotNull);
    });
  });
}
