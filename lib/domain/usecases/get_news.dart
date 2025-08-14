import '../entities/article.dart';
import '../repositories/news_repository.dart';

class GetNews {
  final NewsRepository repository;
  GetNews(this.repository);

  Future<List<Article>> call({String? query}) {
    return repository.getTopHeadlines(query: query);
  }
}
