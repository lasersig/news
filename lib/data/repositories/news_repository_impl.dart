import '../../core/constants.dart';
import '../../core/exceptions.dart';
import '../../domain/entities/article.dart';
import '../../domain/repositories/news_repository.dart';
import '../models/article_model.dart';
import '../services/api_service.dart';

class NewsRepositoryImpl implements NewsRepository {
  final ApiService api;
  NewsRepositoryImpl(this.api);

  @override
  Future<List<Article>> getTopHeadlines({String? query}) async {
    try {
      final data = await api.get('/top-headlines', params: {
        'country': AppConstants.defaultCountry,
        if (query != null && query.trim().isNotEmpty) 'q': query.trim(),
        'pageSize': '50',
      });

      final articlesJson = (data['articles'] as List?) ?? [];
      final models = articlesJson
          .map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
          .toList();

      return models.map((m) => m.toEntity()).toList();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
