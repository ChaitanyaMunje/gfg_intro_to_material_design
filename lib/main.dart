import 'package:flutter/material.dart';
import 'package:intro_to_material_design/AlertDialogs.dart';
import 'package:intro_to_material_design/stop_watch.dart';

import 'DialogAndAlerts.dart';
import 'bottom_nav.dart';
import 'buttonsDemo.dart';
import 'drawerDemo.dart';
import 'google_maps.dart';
import 'information_displays.dart';
import 'input_and_selections.dart';
import 'layouts.dart';
import 'magic_ball.dart';
import 'maps/google_maps_main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intro To Material Design',
      debugShowCheckedModeBanner: false,
      home: StopWatchPage(),
    );
  }
}
