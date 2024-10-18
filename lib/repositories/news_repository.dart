import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import '../models/news_model.dart';
import '../services/local_notification_service.dart';

class NewsRepository {
  final String apiKey = '546dd8adae3a4d1498d17d95faf20d62';

  Future<List<NewsModel>> fetchTopHeadlines() async {
    final response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?apiKey=$apiKey&country=us'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      List<NewsModel> articles = (data['articles'] as List)
          .map((article) {
            return NewsModel.fromJson(article);
          })
          .where((article) => article.title != "[Removed]")
          .toList();

      return articles;
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<List<NewsModel>> fetchEverythingNews() async {
    final response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/everything?q=everything&page=1&pageSize=20&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<NewsModel> articles = (data['articles'] as List)
          .map((article) {
            return NewsModel.fromJson(article);
          })
          .where((article) => article.title != "[Removed]")
          .toList();
      final random = Random();

      int randomIndex = random.nextInt(articles.length);

      await LocalNotificationService.scheduleDailyTenAMLastYearNotification(
        data: articles[randomIndex],
        payload: newsModelToJson(articles[randomIndex]),
      );
      return articles;
    } else {
      throw Exception('Failed to load news');
    }
  }
}
