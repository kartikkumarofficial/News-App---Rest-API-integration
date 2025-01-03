import 'package:flutter/material.dart';
import 'package:newsapp/models/newsInfo.dart';
import 'package:newsapp/services/api_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<NewsModel?>? _newsModel;

  @override
  void initState() {
    _newsModel = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: Container(
        child: FutureBuilder<NewsModel?>(
          future: _newsModel,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData && snapshot.data != null) {
              final articles = snapshot.data!.articles;
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        if (article.urlToImage != null &&
                            article.urlToImage!.isNotEmpty)
                          Image.network(
                            article.urlToImage!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        else
                          Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey,
                            child: const Icon(Icons.image_not_supported),
                          ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            article.title ?? 'No Title Available',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}
