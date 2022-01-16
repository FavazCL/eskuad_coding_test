part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.articles = const [],
  });

  final HomeStatus status;
  final List<Article> articles;

  @override
  List<Object> get props => [status, articles];

  HomeState copyWith({
    HomeStatus? status,
    List<Article>? articles,
  }) {
    return HomeState(
      status: status ?? this.status,
      articles: articles ?? this.articles,
    );
  }
}
