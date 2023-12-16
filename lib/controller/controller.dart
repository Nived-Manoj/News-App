import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/model.dart';

class HomeController {
  Map<String, dynamic> decodedData = {};
  MyModel? newsRes;

  Future getData() async {
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=44fea6646644464582367918560f9e7e ");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      print(decodedData);
      newsRes = MyModel.fromJson(decodedData);
    } else {
      print("error");
    }
  }
}
