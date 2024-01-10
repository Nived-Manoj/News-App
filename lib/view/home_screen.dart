import 'package:cached_network_image/cached_network_image.dart';
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
        body: homeController.isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: CachedNetworkImage(
                          imageUrl: homeController
                                  .newsRes?.articles?[index].urlToImage ??
                              " ",
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                    ListTile(
                      minVerticalPadding: 10,
                      title: Text(
                        homeController.newsRes?.articles?[index].title ?? "",
                      ),
                      subtitle: Text(
                        homeController.newsRes?.articles?[index].description ??
                            "",
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
                          style: TextStyle(
                              fontSize: 16, fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          homeController.newsRes?.articles?[index].publishedAt
                                  .toString() ??
                              "",
                          style: TextStyle(
                              fontSize: 16, fontStyle: FontStyle.italic),
                        ),
                      ],
                    )
                  ],
                ),
              ));
  }
}
