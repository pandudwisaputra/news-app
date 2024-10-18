import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/blocs/news/news_bloc.dart';
import 'package:news_app/blocs/news/news_event.dart';
import 'package:news_app/blocs/news/news_state.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/repositories/news_repository.dart';

// Membuat mock NewsRepository
class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  late NewsBloc newsBloc;
  late MockNewsRepository mockNewsRepository;

  // Data dummy untuk NewsModel
  final newsModelList = [
    NewsModel(
      source: Source(id: "1", name: "Source Name"),
      author: "Author 1",
      title: "Title 1",
      description: "Description 1",
      url: "https://example.com/1",
      urlToImage: "https://example.com/image1.jpg",
      publishedAt: DateTime.parse("2023-10-17T00:00:00Z"),
      content: "Content 1",
    ),
    NewsModel(
      source: Source(id: "2", name: "Source Name 2"),
      author: "Author 2",
      title: "Title 2",
      description: "Description 2",
      url: "https://example.com/2",
      urlToImage: "https://example.com/image2.jpg",
      publishedAt: DateTime.parse("2023-10-18T00:00:00Z"),
      content: "Content 2",
    ),
  ];

  // Setup untuk setiap test
  setUp(() {
    mockNewsRepository = MockNewsRepository();
    newsBloc = NewsBloc(mockNewsRepository);
  });

  // Test untuk FetchTopHeadlinesNews sukses
  blocTest<NewsBloc, NewsState>(
    'emits [NewsLoading, NewsLoaded] when FetchTopHeadlinesNews is successful',
    build: () {
      // Ketika fetchTopHeadlines dipanggil, kembalikan daftar newsModelList dummy
      when(() => mockNewsRepository.fetchTopHeadlines())
          .thenAnswer((_) async => newsModelList);
      return newsBloc;
    },
    act: (bloc) => bloc.add(FetchTopHeadlinesNews()),
    expect: () => [
      NewsLoading(),
      NewsLoaded(newsModelList),
    ],
    verify: (_) {
      verify(() => mockNewsRepository.fetchTopHeadlines()).called(1);
    },
  );

  // Test untuk FetchTopHeadlinesNews gagal
  blocTest<NewsBloc, NewsState>(
    'emits [NewsLoading, NewsError] when FetchTopHeadlinesNews fails',
    build: () {
      // Ketika fetchTopHeadlines dipanggil, lemparkan sebuah exception
      when(() => mockNewsRepository.fetchTopHeadlines())
          .thenThrow(Exception('Failed to fetch news'));
      return newsBloc;
    },
    act: (bloc) => bloc.add(FetchTopHeadlinesNews()),
    expect: () => [
      NewsLoading(),
      NewsError('Failed to fetch news'),
    ],
    verify: (_) {
      verify(() => mockNewsRepository.fetchTopHeadlines()).called(1);
    },
  );

  // Test untuk FetchEverythingNews sukses
  blocTest<NewsBloc, NewsState>(
    'emits [NewsLoading, NewsLoaded] when FetchEverythingNews is successful',
    build: () {
      // Ketika fetchEverythingNews dipanggil, kembalikan daftar newsModelList dummy
      when(() => mockNewsRepository.fetchEverythingNews())
          .thenAnswer((_) async => newsModelList);
      return newsBloc;
    },
    act: (bloc) => bloc.add(FetchEverythingNews()),
    expect: () => [
      NewsLoading(),
      NewsLoaded(newsModelList),
    ],
    verify: (_) {
      verify(() => mockNewsRepository.fetchEverythingNews()).called(1);
    },
  );

  // Test untuk FetchEverythingNews gagal
  blocTest<NewsBloc, NewsState>(
    'emits [NewsLoading, NewsError] when FetchEverythingNews fails',
    build: () {
      // Ketika fetchEverythingNews dipanggil, lemparkan sebuah exception
      when(() => mockNewsRepository.fetchEverythingNews())
          .thenThrow(Exception('Failed to fetch news'));
      return newsBloc;
    },
    act: (bloc) => bloc.add(FetchEverythingNews()),
    expect: () => [
      NewsLoading(),
      NewsError('Failed to fetch news'),
    ],
    verify: (_) {
      verify(() => mockNewsRepository.fetchEverythingNews()).called(1);
    },
  );
}
