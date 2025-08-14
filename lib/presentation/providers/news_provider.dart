
import 'package:flutter/material.dart';
import '../../domain/entities/article.dart';
import '../../domain/usecases/get_news.dart';

class NewsProvider extends ChangeNotifier {
  final GetNews getNews;

  NewsProvider(this.getNews);

  List<Article> _articles = [];
  List<Article> get articles => _filteredQuery?.isNotEmpty == true ? _filtered : _articles;

  bool isLoading = false;
  String? error;
  String? _filteredQuery;
  List<Article> _filtered = [];

  Future<void> fetchNews({String? query}) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      _articles = await getNews(query: query);
      _applyFilter(_filteredQuery);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void setFilter(String? query) {
    _filteredQuery = (query?.trim().isEmpty ?? true) ? null : query!.trim();
    _applyFilter(_filteredQuery);
    notifyListeners();
  }

  void _applyFilter(String? q) {
    if (q == null) {
      _filtered = [];
      return;
    }
    final lower = q.toLowerCase();
    _filtered = _articles.where((a) {
      final inTitle = a.title.toLowerCase().contains(lower);
      final inDesc = (a.description ?? '').toLowerCase().contains(lower);
      final inContent = (a.content ?? '').toLowerCase().contains(lower);
      return inTitle || inDesc || inContent;
    }).toList();
  }
}
