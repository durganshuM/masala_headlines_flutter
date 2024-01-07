import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:masala_headlines_flutter/models/news_headline_model.dart';
import 'package:masala_headlines_flutter/services/network_helper.dart';

class NewsData extends ChangeNotifier {
  final apiKey = '266819b7a57c4e648f12e56dedeb5430';
  final baseURL = 'https://newsapi.org/v2/top-headlines?country=in&apiKey=';
  List<NewsArticle> _newsArticles = [];

  Future<void> getNews() async {
    NetworkHelper networkHelper = NetworkHelper(baseURL + apiKey);
    var responseData = await networkHelper.getData();

    try {
      NewsHeadlineModel newsHeadlineModel = NewsHeadlineModel.fromJson(
          jsonDecode(responseData) as Map<String, dynamic>);
      _newsArticles = newsHeadlineModel.articles!;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  get newsArticlesLength => _newsArticles.length;

  UnmodifiableListView<NewsArticle> get newsArticles {
    return UnmodifiableListView(_newsArticles);
  }
}
