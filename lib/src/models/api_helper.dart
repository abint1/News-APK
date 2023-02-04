import 'dart:convert';
import 'package:http/http.dart';
import 'package:loginfirebase/src/models/news_model.dart';

class ApiHelper {
  static final ApiHelper _instence = ApiHelper.internal();

  factory ApiHelper() => _instence;
  ApiHelper.internal();

  static const _baseurl = "https://saurav.tech/";

  Future getRequest(String route) async {
    String url = _baseurl + route;

    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        return Exception();
      }
    } catch (ex) {
      return Exception();
    }
  }
}
