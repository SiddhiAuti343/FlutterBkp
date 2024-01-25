import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/Model/category_news_model.dart';
import 'package:newsapp/Model/news_channel_headlines_model.dart';
import 'package:newsapp/news_view_model.dart';
import 'dart:convert';

class NewsRepository {
  final String apiKey;
  NewsRepository(this.apiKey);

  Future<NewsChannelsHeadlinesModels> fetchNewsChannelHeadlinesApi(String newsChannel)async{

    String url='https://newsapi.org/v2/top-headlines?sources=$newsChannel&apiKey=7b9c72ad8dc348dc980fc78e89193678';
    print(url);

    final response=  await http.get(Uri.parse(url));
    if(kDebugMode){
      print(response.body);
    }

    if(response.statusCode==200){
      final body=jsonDecode(response.body);

      return NewsChannelsHeadlinesModels.fromJson(body);
    }
    throw Exception('Error');

  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category)async{

    String url='https://newsapi.org/v2/everything?q=general&apiKey=7b9c72ad8dc348dc980fc78e89193678';
    print(url);

    final response=  await http.get(Uri.parse(url));
    if(kDebugMode){
      print(response.body);
    }

    if(response.statusCode==200){
      final body=jsonDecode(response.body);

      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('Error');

  }



}