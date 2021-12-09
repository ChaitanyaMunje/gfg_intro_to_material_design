import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountDownTimerPage extends StatefulWidget {
  const CountDownTimerPage({Key? key}) : super(key: key);

  @override
  _CountDownTimerPageState createState() => _CountDownTimerPageState();
}

class _CountDownTimerPageState extends State<CountDownTimerPage> {
  int counter = 60;
  late Timer timer;

  void startTimer() {
    counter = 60;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (counter > 0) {
        setState(() {
          counter--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Count Down Timer"),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$counter",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  startTimer();
                },
                child: Text("Start Timer")),
          ],
        ),
      ),
    );
  }
}
