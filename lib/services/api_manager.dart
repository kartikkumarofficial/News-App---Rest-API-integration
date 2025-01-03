import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/newsInfo.dart';

class API_Manager {
  Future<NewsModel?> getNews() async {
    var client = http.Client();
    NewsModel? newsModel;

    try {
      var response = await client.get(Uri.parse(
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=c423cad5df3948baa6dc529c5693b443',
      ));

      if (response.statusCode == 200) {
        var jsonString = response.body; // Raw JSON response
        var jsonMap = json.decode(jsonString); // Decode JSON into a Map
        newsModel = NewsModel.fromJson(jsonMap); // Map JSON to NewsModel object
      } else {
        print('Failed to load news. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      client.close();
    }

    return newsModel;
  }
}
