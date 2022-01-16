import 'package:articles_repository/articles_repository.dart';
import 'package:eskuad_coding_test/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        articlesRepository: context.read<ArticlesRepository>(),
      )..add(const StatsSubscriptionRequested()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeBloc>().state;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: state.articles.isNotEmpty
          ? ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                final article = state.articles[index];
                return ListTile(
                  key: const Key('statsView_completedTodos_listTile'),
                  leading: const Icon(Icons.check_rounded),
                  title: Text(article.author ?? ''),
                  trailing: Text(
                    '${article.title}',
                    style: textTheme.headline5,
                  ),
                );
              },
            )
          : const Center(
              child: Text('Empty'),
            ),
    );
  }
}
