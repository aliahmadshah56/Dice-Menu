import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/NumberDices.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dice App',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: ListView(
        children: [

//#Dices

          Padding(
            padding: EdgeInsets.only(top: 15, left: 10),
            child: Text("Dices",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          Numberdices(),

        ],
      ),

    );
  }
}
