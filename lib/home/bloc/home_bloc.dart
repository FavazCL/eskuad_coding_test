import 'package:articles_repository/articles_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required ArticlesRepository articlesRepository,
  })  : _articlesRepository = articlesRepository,
        super(const HomeState()) {
    on<ArticlesSubscriptionRequest>(onSubscriptionRequested);
  }

  final RefreshController refreshController = RefreshController();
  final ArticlesRepository _articlesRepository;

  void onRefresh() {
    add(const ArticlesSubscriptionRequest());
    refreshController.refreshCompleted();
  }

  Future<void> onSubscriptionRequested(
    ArticlesSubscriptionRequest event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));

    await emit.forEach<List<Article>>(
      _articlesRepository.getArticles(),
      onData: (articles) {
        articles.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

        return state.copyWith(
        status: HomeStatus.success,
        articles: articles,
      );
      },
      onError: (_, __) => state.copyWith(status: HomeStatus.failure),
    );
  }
}
