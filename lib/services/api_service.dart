import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiKey = '51f0c84df9494dd8b5a1968e1141c16e';
  static const String baseUrl = 'https://newsapi.org/v2';

 Future<List<dynamic>> fetchNews(String category) async {
  final String url = category.isEmpty
      ? '$baseUrl/top-headlines?country=us&apiKey=$apiKey'
      : '$baseUrl/top-headlines?country=us&category=$category&apiKey=$apiKey';

  print('Fetching news from URL: $url');

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    print('API Response: ${data['articles']}'); // Debug response
    return data['articles'];
  } else {
    print('Error: ${response.body}');
    throw Exception('Failed to load news');
  }
}

}
