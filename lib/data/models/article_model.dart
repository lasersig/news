import '../../domain/entities/article.dart';


class ArticleModel {
  final String title;
  final String? imageUrl;
  final String? content;
  final String? description;
  final String? url;
  final String? sourceName;
  final DateTime? publishedAt;

  ArticleModel({
    required this.title,
    this.imageUrl,
    this.content,
    this.description,
    this.url,
    this.sourceName,
    this.publishedAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] ?? '',
      imageUrl: json['urlToImage'] as String?,
      content: json['content'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      sourceName: (json['source'] != null) ? json['source']['name'] as String? : null,
      publishedAt: (json['publishedAt'] != null)
          ? DateTime.tryParse(json['publishedAt'])
          : null,
    );
  }


  Article toEntity() {
    return Article(
      title: title,
      imageUrl: imageUrl,
      content: content,
      description: description,
      url: url,
      sourceName: sourceName,
      publishedAt: publishedAt,
    );
  }
}
