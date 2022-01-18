import 'package:articles_repository/articles_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required ArticlesRepository articlesRepository,
  })  : _articlesRepository = articlesRepository,
        super(const HomeState()) {
    on<ArticlesSubscriptionRequest>(_onSubscriptionRequested);
  }

  final ArticlesRepository _articlesRepository;

  Future<void> _onSubscriptionRequested(
    ArticlesSubscriptionRequest event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));

    await emit.forEach<List<Article>>(
      _articlesRepository.getArticles(),
      onData: (articles) => state.copyWith(
        status: HomeStatus.success,
        articles: articles,
      ),
      onError: (_, __) => state.copyWith(status: HomeStatus.failure),
    );
  }
}
