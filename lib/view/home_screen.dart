import 'package:flutter/material.dart';

import '../controller/controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = HomeController();
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    homeController.getData();
    setState(() {});
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
