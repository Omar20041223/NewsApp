import 'package:dio/dio.dart';
import 'package:news/models/atriclesModel.dart';

class NewsService {
  final Dio dio = Dio();
  Future<List<ArticelModel>> getNews(String category, String country) async {
    Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=8996815353ff4de098515ac632193442");
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData["articles"];
    List<ArticelModel> articlesList = [];
    for (var i in articles) {
      if (i["title"] != "[Removed]") {
        articlesList.add(ArticelModel.fromJson(i));
      }
    }
    return articlesList;
  }
}
