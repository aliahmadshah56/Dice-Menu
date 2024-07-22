import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Dicen(),
  ));
}

class Dicen extends StatefulWidget {
  @override
  _DiceAppState createState() => _DiceAppState();
}

class _DiceAppState extends State<Dicen> {
  int numDice = 3;
  List<int> diceValues = List.generate(3, (_) => 1);
  int totalSum = 0;
  int rollCount = 0;
  int cumulativeSum = 0;
  int maxRolls=0;

  void rollDice() {
    if (rollCount < maxRolls) {
      setState(() {
        totalSum = 0;
        for (int i = 0; i < numDice; i++) {
          diceValues[i] = Random().nextInt(6) + 1;
          totalSum += diceValues[i];
        }
        rollCount++;
        cumulativeSum += totalSum;
      });
    }
  }

  void reset() {
    setState(() {
      diceValues = List.generate(2, (_) => 1);
      numDice = 1;
      totalSum = 0;
      rollCount = 0;
      cumulativeSum = 0;
      maxRolls=0;
    });
  }

  void incrementDice() {
    setState(() {
      numDice++;
      diceValues.add(1);
    });
  }

  void decrementDice() {
    if (numDice > 2) {  // Ensure at least two dice
      setState(() {
        numDice--;
        diceValues.removeLast();
      });
    }
  }

  void incrementRoll() {
    setState(() {
      maxRolls++;
    });
  }

  void decrementRoll() {
    if (numDice > 2) {  // Ensure at least two dice
      setState(() {
        maxRolls--;
      });
    }
  }

  void roll()
  {
    setState(() {
      maxRolls=numDice;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dice App',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dices',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(width: 10,),
                InkWell(
                  onTap: incrementDice,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2.0,
                            blurRadius: 10.0,
                          )
                        ]),
                    child: Text(
                      '+',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '$numDice',

                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: decrementDice,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2.0,
                            blurRadius: 10.0,
                          )
                        ]),
                    child: Text(
                      '-',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Text('Clicks',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(width: 10,),
                InkWell(
                  onTap: incrementRoll,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2.0,
                            blurRadius: 10.0,
                          )
                        ]),
                    child: Text(
                      '+',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '$maxRolls',

                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: decrementRoll,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2.0,
                            blurRadius: 10.0,
                          )
                        ]),
                    child: Text(
                      '-',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,  // Number of dice in a row
                  childAspectRatio: 1, // Aspect ratio of each dice
                ),
                itemCount: numDice,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: rollDice,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset(
                        'images/d${diceValues[index]}.png',
                        height: 150,
                        width: 150,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Currently Sum = $totalSum',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Total Clicks = $rollCount',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Cumulative Sum = $cumulativeSum',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: reset,
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2.0,
                        blurRadius: 10.0,
                      )
                    ]),
                child: Text(
                  'Reset',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
                      ],
        ),
      ),
    );
  }
}
