// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:eskuad_coding_test/bootstrap.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:local_storage_articles_api/local_storage_articles_api.dart';



void main() {
  FlutterServicesBinding.ensureInitialized();

  final articlesApi = LocalStorageArticlesApi();
  bootstrap(articlesApi: articlesApi);
}
