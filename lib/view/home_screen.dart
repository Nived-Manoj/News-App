import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> decodedData = {};
  MyModel? newsRes;
  void initState() {
    getData();
    super.initState();
  }

  Future getData() async {
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=44fea6646644464582367918560f9e7e ");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      print(decodedData);
      newsRes = MyModel.fromJson(decodedData);
      setState(() {});
    } else {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 300,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Image.network(
                    newsRes?.articles?[index].urlToImage ?? " ",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListTile(
                minVerticalPadding: 10,
                title: Text(
                  newsRes?.articles?[index].title ?? "",
                ),
                subtitle: Text(
                  newsRes?.articles?[index].description ?? "",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    newsRes?.articles?[index].author ?? "",
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    newsRes?.articles?[index].publishedAt.toString() ?? "",
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
