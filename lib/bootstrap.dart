// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';

import 'package:articles_api/articles_api.dart';
import 'package:articles_repository/articles_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:eskuad_coding_test/app/view/app.dart';
import 'package:flutter/widgets.dart';
import 'package:local_storage_articles_api/local_storage_articles_api.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap({
  required ArticlesApi articlesApi,
  required LocalStorageArticlesApi localStorageApi,
}) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final articlesRepository = ArticlesRepository(
    articlesApi: articlesApi,
    localStorageArticlesApi: localStorageApi,
  );

  await runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(
          App(articlesRepository: articlesRepository),
        ),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
