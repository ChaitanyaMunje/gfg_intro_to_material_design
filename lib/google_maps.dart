import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intro_to_material_design/google_maps.dart';

class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({Key? key}) : super(key: key);

  @override
  _GoogleMapsPageState createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  Set<Marker> markerList = {};

  void onMapCreated(GoogleMapController controller){
    setState(() {
      markerList.add(Marker(markerId: MarkerId('id-1'),position: LatLng(28.6139, 77.2090),infoWindow: InfoWindow(
        title: 'Delhi',
        snippet: 'Capital of India',
      ) ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Maps")),
      body: GoogleMap(onMapCreated:onMapCreated,
        markers: markerList,
        initialCameraPosition: CameraPosition(target: LatLng(28.6139, 77.2090),zoom: 15),),
    );
  }
}
