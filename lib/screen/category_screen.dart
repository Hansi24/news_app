import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/news_view_model.dart';
import 'widgets/news_list.dart';

class CategoryScreen extends StatefulWidget {
  final String category;

  const CategoryScreen({required this.category});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<void> _fetchNewsFuture;

  @override
  void initState() {
    super.initState();
    _fetchNewsFuture = Provider.of<NewsViewModel>(context, listen: false)
        .fetchNewsByCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    final newsViewModel = Provider.of<NewsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category} News'),
      ),
      body: FutureBuilder(
        future: _fetchNewsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return NewsList(newsList: newsViewModel.newsList);
          }
        },
      ),
    );
  }
}

