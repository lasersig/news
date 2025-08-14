import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants.dart';
import 'data/repositories/news_repository_impl.dart';
import 'data/services/api_service.dart';
import 'domain/usecases/get_news.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/providers/news_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Simple manual DI
  final api = ApiService();
  final repo = NewsRepositoryImpl(api);
  final usecase = GetNews(repo);

  runApp(MyApp(getNews: usecase));
}

class MyApp extends StatelessWidget {
  final GetNews getNews;
  const MyApp({super.key, required this.getNews});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewsProvider(getNews),
      child: MaterialApp(
        title: 'Clean News',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
