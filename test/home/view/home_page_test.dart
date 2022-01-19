// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:articles_api/articles_api.dart';
import 'package:articles_repository/articles_repository.dart';
import 'package:articles_repository/utils/network_info.dart';
import 'package:eskuad_coding_test/app/app.dart';
import 'package:eskuad_coding_test/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_storage_articles_api/local_storage_articles_api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MockArticlesApi extends Mock implements ArticlesApi {}

class MockLocalStorageApi extends Mock implements LocalStorageArticlesApi {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockArticlesRepository extends Mock implements ArticlesRepository {}

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
  group('HomePage', () {
    testWidgets('renders HomeView', (tester) async {
      await tester.pumpWidget(App(articlesRepository: articlesRepository));
      expect(find.byType(HomeView), findsOneWidget);
    });
  });
}
