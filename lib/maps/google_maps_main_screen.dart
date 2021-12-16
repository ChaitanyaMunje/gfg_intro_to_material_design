import 'package:flutter/material.dart';
import 'package:intro_to_material_design/maps/google_map_directions.dart';
import 'package:intro_to_material_design/maps/google_maps_polylines.dart';

import 'google_map_marker.dart';

class MapsMainPage extends StatefulWidget {
  const MapsMainPage({Key? key}) : super(key: key);

  @override
  _MapsMainPageState createState() => _MapsMainPageState();
}

class _MapsMainPageState extends State<MapsMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text("Google Maps"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GoogleMapsMarker()));
                },
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: Text("View Marker on Maps")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GoogleMapsPolyLines()));
                },
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: Text("View PolyLines")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GoogleMapsDirections()));
              },
              child: Text("View Directions"),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
