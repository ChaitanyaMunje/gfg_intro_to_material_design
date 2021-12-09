import 'dart:math';

import 'package:flutter/material.dart';

class MagicBallPage extends StatelessWidget {
  const MagicBallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(title: Text("Magic 8 Ball Game"),backgroundColor: Colors.grey[800],elevation: 0,centerTitle: true,),
      body: Ball(),
    );
  }
}
class Ball extends StatefulWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(onPressed: (){
        setState(() {
          ballNumber = Random().nextInt(4)+1;
        });
      }, child: Image.asset('images/ball$ballNumber.png')),
    );
  }
}
