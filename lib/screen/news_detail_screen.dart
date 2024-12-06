import 'package:flutter/material.dart';
import '../../models/news_model.dart';

class NewsDetailScreen extends StatelessWidget {
  final News news;

  NewsDetailScreen({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(news.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(news.imageUrl, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(news.author, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(news.publishedAt, style: TextStyle(color: Colors.grey)),
            SizedBox(height: 16),
            Text(news.content),
          ],
        ),
      ),
    );
  }
}
