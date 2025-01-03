import 'package:flutter/material.dart';
import 'package:newsapp/models/newsInfo.dart';
import 'package:newsapp/services/api_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<NewsModel>? _newsModel;

  @override
  void initState() {
    _newsModel = API_Manager().getNews();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('News App'),
      ),
      body:Container(
        child:
        FutureBuilder(
          future: _newsModel,
          child: ListView.builder(
              // itemCount: .length,
              itemBuilder: (context,index) {
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.red,
                );

              },
          ),
        ),

      ),
    );;
  }
}
