import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsMarker extends StatefulWidget {
  const GoogleMapsMarker({Key? key}) : super(key: key);

  @override
  _GoogleMapsMarkerState createState() => _GoogleMapsMarkerState();
}

class _GoogleMapsMarkerState extends State<GoogleMapsMarker> {
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
      appBar: AppBar(title: Text("Google Maps"),backgroundColor: Colors.green,),
      body: GoogleMap(onMapCreated:onMapCreated,
        markers: markerList,
        initialCameraPosition: CameraPosition(target: LatLng(28.6139, 77.2090),zoom: 15),),
    );
  }
}
