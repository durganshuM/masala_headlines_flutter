import 'package:masala_headlines_flutter/services/network_helper.dart';

const apiKey = '266819b7a57c4e648f12e56dedeb5430';
const baseURL =
    'https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey';

class NewsModel {
  Future<dynamic> getNews() async {
    NetworkHelper networkHelper = NetworkHelper(baseURL);

    var decodedData = await networkHelper.getData();
    return decodedData;
  }
}
