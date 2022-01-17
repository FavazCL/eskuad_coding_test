// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:articles_api/articles_api.dart';
import 'package:articles_repository/utils/network_info.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:eskuad_coding_test/bootstrap.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:local_storage_articles_api/local_storage_articles_api.dart';

Future<void> main() async {
  FlutterServicesBinding.ensureInitialized();

  final articlesApi = ArticlesApi();
  final localStorageApi = LocalStorageArticlesApi();
  final checker = await Connectivity().checkConnectivity();
  final networkInfo = NetworkInfoImpl(checker);

  return bootstrap(
    articlesApi: articlesApi,
    localStorageApi: localStorageApi,
    networkInfo: networkInfo,
  );
}
