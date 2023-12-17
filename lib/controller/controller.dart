import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/model.dart';

class HomeController with ChangeNotifier {
  Map<String, dynamic> decodedData = {};
  MyModel? newsRes;
  bool isLoading = false;

  Future getData() async {
    isLoading = true;
    notifyListeners();
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
    isLoading = false;
    notifyListeners();
  }
}
