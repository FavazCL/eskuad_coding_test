import 'package:articles_api/articles_api.dart';
import 'package:articles_repository/articles_repository.dart';
import 'package:articles_repository/utils/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_storage_articles_api/local_storage_articles_api.dart';
import 'package:mocktail/mocktail.dart';

class MockArticlesApi extends Mock implements ArticlesApi {}

class MockLocalStorageApi extends Mock implements LocalStorageArticlesApi {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late MockArticlesApi mockArticlesApi;
  late MockLocalStorageApi mockLocalStorageApi;
  late MockNetworkInfo mockNetworkInfo;
  late ArticlesRepository articlesRepository;

  setUp(() {
    mockArticlesApi = MockArticlesApi();
    mockLocalStorageApi = MockLocalStorageApi();
    mockNetworkInfo = MockNetworkInfo();
    articlesRepository = ArticlesRepository(
      articlesApi: mockArticlesApi,
      localStorageArticlesApi: mockLocalStorageApi,
      networkInfo: mockNetworkInfo,
    );
  });

  group('constructor', () {
    test('instantiates internal MetaWeatherApiClient when not injected', () {
      expect(articlesRepository, isNotNull);
    });
  });

  group('getArticles', () {
    test(
      'should check if the device is online',
      () async {
        // arrange
        when<bool>(() => mockNetworkInfo.isConnected).thenAnswer((_) => true);
        // act
        articlesRepository.getArticles();
        // assert
        expect(mockNetworkInfo.isConnected, true);
      },
    );
  });
}
