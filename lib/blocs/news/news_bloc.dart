import 'package:flutter_bloc/flutter_bloc.dart';
import 'news_event.dart';
import 'news_state.dart';
import '../../repositories/news_repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc(this.newsRepository) : super(NewsInitial()) {
    on<FetchTopHeadlinesNews>((event, emit) async {
      emit(NewsLoading());
      try {
        final articles = await newsRepository.fetchTopHeadlines();
        emit(NewsLoaded(articles));
      } catch (e) {
        emit(NewsError('Failed to fetch news'));
      }
    });

    on<FetchEverythingNews>((event, emit) async {
      emit(NewsLoading());
      try {
        final articles = await newsRepository.fetchEverythingNews();
        emit(NewsLoaded(articles));
      } catch (e) {
        emit(NewsError('Failed to fetch news'));
      }
    });
  }
}
