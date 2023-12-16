import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    Provider.of<HomeController>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
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
                    homeController.newsRes?.articles?[index].urlToImage ?? " ",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListTile(
                minVerticalPadding: 10,
                title: Text(
                  homeController.newsRes?.articles?[index].title ?? "",
                ),
                subtitle: Text(
                  homeController.newsRes?.articles?[index].description ?? "",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homeController.newsRes?.articles?[index].author ?? "",
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    homeController.newsRes?.articles?[index].publishedAt
                            .toString() ??
                        "",
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
