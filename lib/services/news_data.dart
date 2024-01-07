import 'package:flutter/foundation.dart';
import 'package:masala_headlines_flutter/services/network_helper.dart';

const apiKey = '266819b7a57c4e648f12e56dedeb5430';
const baseURL =
    'https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey';

class NewsData extends ChangeNotifier {
  List _newsArticles = [];

  Future<void> getNews() async {
    NetworkHelper networkHelper = NetworkHelper(baseURL);

    var decodedData = await networkHelper.getData();

    _newsArticles = decodedData['articles'];
    for (var i = 0; i < _newsArticles.length; i++) {
      print(_newsArticles[i]);
    }
    notifyListeners();
  }

  get getNewsArticles => _newsArticles;
}
