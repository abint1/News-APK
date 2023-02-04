import 'package:loginfirebase/src/models/api_helper.dart';
import 'package:loginfirebase/src/models/news_model.dart';

class linearRepositary {
  Future<User> fetchNews() async {
    String route = "NewsAPI/everything/cnn.json";
    var response = await ApiHelper.internal().getRequest(route);
    return response;
  }
}
