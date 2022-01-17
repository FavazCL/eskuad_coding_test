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
              shrinkWrap: true,
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                final article = state.articles[index];

                return Text('a: ${article.createdAt} - id: ${article.id}');
              },
            )
          : const Center(
              child: Text('Empty'),
            ),
    );
  }
}
