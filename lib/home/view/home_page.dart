import 'package:articles_repository/articles_repository.dart';
import 'package:eskuad_coding_test/home/home.dart';
import 'package:eskuad_coding_test/home/view/widgets/article_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        articlesRepository: context.read<ArticlesRepository>(),
      )..add(const ArticlesSubscriptionRequest()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeBloc>().state;

    return Scaffold(
      body: SafeArea(
        child: SmartRefresher(
          primary: true,
          header: const ClassicHeader(
            completeDuration: Duration(seconds: 2),
            completeText: 'Actualización exitosa',
            refreshingText: 'Actualizando',
            releaseText: 'Suelte para actualizar',
            failedText: 'Ha ocurrido un error al refrescar',
          ),
          controller: context.read<HomeBloc>().refreshController,
          onRefresh: context.read<HomeBloc>().onRefresh,
          child: _handlerWidget(state),
        ),
      ),
    );
  }

  Widget _handlerWidget(HomeState state) {
    if (state.status == HomeStatus.success) {
      return ArticleList(articles: state.articles);
    } else if (state.status == HomeStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state.status == HomeStatus.initial) {
      return const SizedBox.shrink();
    } else {
      return const Text('Ha ocurrido un error');
    }
  }
}
