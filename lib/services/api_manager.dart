import 'package:http/http.dart' as http;

class API_Manager{
  void getNews(){
    var client = http.Client();
    client.get(Uri.parse('https://newsapi.org/v2/everything?domains=wsj.com&apiKey=c423cad5df3948baa6dc529c5693b443'));


  }
}