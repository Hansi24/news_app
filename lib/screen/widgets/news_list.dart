import 'package:flutter/material.dart';
import '../../models/news_model.dart';
import '../news_detail_screen.dart';
import 'package:provider/provider.dart';
import '../../view_models/news_view_model.dart';

class NewsList extends StatelessWidget {
  final List<News> newsList;

  NewsList({required this.newsList});

  @override
  Widget build(BuildContext context) {
    // Access the NewsViewModel to handle favorites
    final newsViewModel = Provider.of<NewsViewModel>(context);

    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        final news = newsList[index];
        
        // Check if the news is in the favorites list
        bool isFavorite = newsViewModel.favoriteNews.contains(news);

        return ListTile(
          leading: news.imageUrl.isNotEmpty
              ? Image.network(news.imageUrl, width: 100, height: 100, fit: BoxFit.cover)
              : Container(width: 100, height: 100, color: Colors.grey),
          title: Text(news.title),
          subtitle: Text(news.publishedAt),
          trailing: IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
            onPressed: () {
              // Add or remove news from favorites
              if (isFavorite) {
                newsViewModel.removeFromFavorites(news);
              } else {
                newsViewModel.addToFavorites(news);
              }
            },
          ),
          onTap: () {
            // Navigate to the NewsDetailScreen when a news item is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsDetailScreen(news: news),
              ),
            );
          },
        );
      },
    );
  }
}
