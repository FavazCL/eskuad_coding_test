import 'package:articles_repository/articles_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:eskuad_coding_test/home/home.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockArticlesRepository extends Mock implements ArticlesRepository {}

class MockHomeBloc extends MockBloc<HomeEvent, HomeState>
    implements HomeBloc {}

void main() {
  MockArticlesRepository? mockArticlesRepository;
  MockHomeBloc? mockHomeBloc;

  setUp(() {
    mockArticlesRepository = MockArticlesRepository();
    mockHomeBloc = MockHomeBloc();
  });

  group('Get Articles', () {
    final article = Article(id: '1', title: 'Felipe', author: 'Vergara', createdAt: DateTime.now(),);

  });
}
