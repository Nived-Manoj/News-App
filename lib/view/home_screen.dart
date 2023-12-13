import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              ListTile(
                minVerticalPadding: 10,
                title: Text(
                  "TTTTTTTTTTTTTTTTTTTTTTTTTTFFFFFFFFFFFFFFFFFSSSSSSSSSSSSSSSSSKKKKKKKKKKKKKKKKL",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "dgfhghsgfhgsafghsgfsdghgagjhshdddddddddddd,,,,,,JHJJJJJJJJJJJJJJJJJJJJJJJSDAAAAAAAAAAAAAAsddshadshdjgshghsjgjhsafjgsdafgshdfgsdhfghsfhajghdgfhdgshgAAAAAAHLGhggergfelfgdlfdshfjhgfahgdshjgfh",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Author d cruzy",
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "21/12/2017",
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
