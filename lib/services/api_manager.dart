import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/models/newsInfo.dart';

class API_Manager {
  void getNews() async {
    var client = http.Client();
    var response = await client.get(Uri.parse('https://newsapi.org/v2/everything?domains=wsj.com&apiKey=c423cad5df3948baa6dc529c5693b443'));
    if(response.statusCode==200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      // var jsonMap = newsModelFromJson(jsonString);
      NewsModel.fromJson(jsonMap);





    }



  }
}