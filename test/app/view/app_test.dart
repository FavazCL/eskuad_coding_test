// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:articles_repository/articles_repository.dart';
import 'package:eskuad_coding_test/app/app.dart';
import 'package:eskuad_coding_test/home/home.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockArticlesRepository extends Mock
    implements ArticlesRepository {}

void main() {
  late MockArticlesRepository? mockArticlesRepository;

  setUp(() {
    mockArticlesRepository = MockArticlesRepository();
  });
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
       await tester.pumpWidget(App(articlesRepository: mockArticlesRepository!));
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
