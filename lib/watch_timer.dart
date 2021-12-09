import 'dart:async';

import 'package:flutter/material.dart';

class WatchTimer extends StatefulWidget {
  const WatchTimer({Key? key}) : super(key: key);

  @override
  _WatchTimerState createState() => _WatchTimerState();
}

class _WatchTimerState extends State<WatchTimer> {
  Duration duration = Duration();
  Timer? timer;

  void startTimer(){
   timer = Timer.periodic(Duration(seconds: 1),(_) => addTime());
  }

  void addTime(){
    final addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds+addSeconds;
      duration = Duration(seconds: seconds);


    });
  }
  @override
  void initState() {
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:buildTime()
    )
    );
  }

  Widget buildTime(){
    String twoDigits(int n)=> n.toString().padLeft(2,'0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Text('${duration.inSeconds}',style: TextStyle(fontSize: 80),);
  }
}
