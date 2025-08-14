class Article {
  final String title;
  final String? imageUrl;
  final String? content;
  final String? description;
  final String? url;
  final String? sourceName;
  final DateTime? publishedAt;

  const Article({
    required this.title,
    this.imageUrl,
    this.content,
    this.description,
    this.url,
    this.sourceName,
    this.publishedAt,
  });
}
