import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(30)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 280),
            child: Text(
              "Author d cruzy",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
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
          )
        ],
      ),
    );
  }
}
