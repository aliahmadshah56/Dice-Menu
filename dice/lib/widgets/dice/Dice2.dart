import 'package:flutter/material.dart';
import 'dart:math';

class Dice2 extends StatefulWidget {
  @override
  DiceState createState() => DiceState();
}

class DiceState extends State<Dice2> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int diceNumber1 = 1;
  int diceNumber2 = 3;
  int sum1 = 0, sum2 = 0;
  int c1 = 0;
  int a = 0;
  int count = 0;
  int t = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void rollDice1() {
    _animationController.forward(from: 0).then((_) {
      setState(() {
        if (c1 < count) {
          diceNumber1 = Random().nextInt(6) + 1;
          sum1 += diceNumber1;
        }
      });
      _animationController.reverse(from: 1);
    });
  }

  void rollDice2() {
    _animationController.forward(from: 0).then((_) {
      setState(() {
        if (c1 < count) {
          diceNumber2 = Random().nextInt(6) + 1;
          sum2 += diceNumber2;
        }
      });
      _animationController.reverse(from: 1);
    });
  }

  void clicks() {
    c1++;
  }

  void total() {
    t = sum1 + sum2;
  }

  void reset() {
    setState(() {
      c1 = 0;
      sum1 = 0;
      sum2 = 0;
      t = 0;
    });
  }

  void counter() {
    setState(() {
      count = count + 1;
    });
  }

  void dec() {
    setState(() {
      count = count - 1;
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    counter();
                  },
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
                SizedBox(
                  width: 10,
                ),
                Text(
                  '$count',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    dec();
                  },
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: GestureDetector(
                    onTap: () {
                      rollDice1();
                      rollDice2();
                      total();
                      clicks();
                    },
                    child: AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: _animationController.value * pi,
                            child: Image.asset(
                              'images/d$diceNumber1.png',
                              height: 150,
                              width: 150,
                            ),
                          );
                        }),
                  ),
                ),
                Container(
                  height: 200,
                  width: 200,
                  child: GestureDetector(
                    onTap: () {
                      rollDice1();
                      rollDice2();
                      total();
                      clicks();
                    },
                    child: AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: _animationController.value * pi,
                            child: Image.asset(
                              'images/d$diceNumber2.png',
                              height: 150,
                              width: 150,
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Text(
                    'Total =$t',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 30.0,
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        reset();
                      },
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
                ))
          ],
        ),
      ),
    );
  }
}
