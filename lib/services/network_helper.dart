import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.baseURL);

  String baseURL;

  Future<dynamic> getData() async {
    var url = Uri.parse(baseURL);
    print(baseURL);

    try {
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print('Network Error: $e');
    }

    return null;
  }
}
