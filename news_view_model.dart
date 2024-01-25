import 'package:newsapp/Model/category_news_model.dart';
import 'package:newsapp/Model/news_channel_headlines_model.dart';
import 'package:newsapp/repository/news_repository.dart';


class NewsViewModel {

  final _rep = NewsRepository('7b9c72ad8dc348dc980fc78e89193678');

  Future<NewsChannelsHeadlinesModels> fetchNewsChannelHeadlinesApi() async {
    final response = await _rep.fetchNewsChannelHeadlinesApi('bbc-news');

    return response;
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi( categoryName) async {
    final response = await _rep.fetchCategoriesNewsApi('category');
    return response;
  }
}
