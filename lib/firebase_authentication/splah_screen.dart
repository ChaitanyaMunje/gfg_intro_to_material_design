import 'dart:async';

import 'package:flutter/material.dart';

const String LoggedInKey = 'LoggedIn';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final size = query.size;
    final itemWidth = size.width * 0.4;
    final itemHeight = itemWidth * (size.width / size.height);
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjCKpx2s5rvmg1lP4PHRr0IKeq9-ttI0IQe1L1gw2mdG0-RDpZvniwxvE&s=10',
                width: itemWidth,
                height: itemHeight,
              ),
            ),
          ),
          Center(
              child: Text(
            "Flutter Firebase Auth",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w700),
          )),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 40),
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Image.asset(
          //       'assets/tag.png',
          //       width: itemWidth,
          //       height: itemHeight,
          //     ),
          //   ),
          // )
        ]),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer(const Duration(milliseconds: 2000), () {
      Navigator.pushReplacementNamed(
        context,
        '/auth',
      );
    });
  }
}
