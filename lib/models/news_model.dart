class News {
  final String title;
  final String description;
  final String imageUrl;
  final String publishedAt;
  final String author;
  final String content;

  News({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.publishedAt,
    required this.author,
    required this.content,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      author: json['author'] ?? '',
      content: json['content'] ?? '',
    );
  }
}
