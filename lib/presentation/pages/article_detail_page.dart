import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/article.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;
  const ArticleDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final dateStr = (article.publishedAt != null)
        ? DateFormat('MMM d, yyyy • HH:mm').format(article.publishedAt!.toLocal())
        : null;

    return Scaffold(
      appBar: AppBar(title: const Text('Article')),
      body: ListView(
        children: [
          if ((article.imageUrl ?? '').isNotEmpty)
            CachedNetworkImage(
              imageUrl: article.imageUrl!,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (c, _) => Container(
                height: 220,
                color: Colors.black12,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              ),
              errorWidget: (c, _, __) => Container(
                height: 220,
                color: Colors.black12,
                alignment: Alignment.center,
                child: const Icon(Icons.broken_image, size: 48),
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              article.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (dateStr != null || article.sourceName != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Text(
                [
                  if (article.sourceName != null) article.sourceName!,
                  if (dateStr != null) dateStr,
                ].join(' • '),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[700],
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: Text(
              (article.content?.trim().isNotEmpty == true)
                  ? article.content!.trim()
                  : (article.description ?? 'No content available.'),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
