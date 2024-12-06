import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/news_view_model.dart';
import '../models/news_model.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the NewsViewModel to get the list of favorite news
    final newsViewModel = Provider.of<NewsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite News'),
        actions: [
          // Action to refresh the list
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Implement a method to refresh the favorite news list if needed
              newsViewModel.fetchAllNews();
            },
          ),
        ],
      ),
      body: newsViewModel.favoriteNews.isEmpty
          ? Center(child: Text('No favorite news', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey))) // Message when no favorites
          : ListView.builder(
              itemCount: newsViewModel.favoriteNews.length,
              itemBuilder: (context, index) {
                final News news = newsViewModel.favoriteNews[index];

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(12),
                    leading: news.imageUrl != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              news.imageUrl!,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Icon(Icons.image, size: 40, color: Colors.grey),
                    title: Text(
                      news.title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      news.description ?? 'No description available',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        // Confirm before removing from favorites
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Remove from Favorites'),
                            content: Text('Are you sure you want to remove this article from your favorites?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  newsViewModel.removeFromFavorites(news);
                                  Navigator.of(context).pop();
                                },
                                child: Text('Yes'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
