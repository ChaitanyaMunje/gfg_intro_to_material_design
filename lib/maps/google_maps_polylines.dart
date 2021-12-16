import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsPolyLines extends StatefulWidget {
  const GoogleMapsPolyLines({Key? key}) : super(key: key);

  @override
  _GoogleMapsPolyLinesState createState() => _GoogleMapsPolyLinesState();
}

 double originLatitude = 6.5215402;
 double originLongitude = 3.3679965;
 double destinationLatitude = 6.849660;
 double destinationLongitude = 3.648190;

 Map<MarkerId,Marker> markers = {};
 PolylinePoints polylinePoints = PolylinePoints();
 Map<PolylineId,Polyline> polylines = {};


class _GoogleMapsPolyLinesState extends State<GoogleMapsPolyLines> {
  Completer<GoogleMapController> controller = Completer();
  static final CameraPosition googlePlex = CameraPosition(target: LatLng(originLatitude, originLongitude),
    zoom: 9.4746,
  );

  void addMarker(LatLng position, String id, BitmapDescriptor descriptor){
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(markerId: markerId,icon: descriptor,position: position);
    markers[markerId] = marker;
  }

  void addPolyLine(List<LatLng> polylineCoordinates){
  PolylineId id = PolylineId("Poly");
  Polyline polyline = Polyline(polylineId: id,points: polylineCoordinates,width: 8);
  polylines[id] = polyline;
  setState(() {
  });
  }

  void getPolyLine() async{
    List<LatLng> polylineCoordinates = [];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates("AIzaSyCRk6Z110vr-lzKprpE56SwJTs_nzqRK14",
        PointLatLng(originLatitude, originLongitude),
        PointLatLng(destinationLatitude, destinationLongitude),
        travelMode: TravelMode.driving,
    );
    if(result.points.isNotEmpty){
      result.points.forEach((PointLatLng point){
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }else{
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }



  @override
  void initState() {
    addMarker(LatLng(originLatitude, originLongitude), "Origin", BitmapDescriptor.defaultMarker);
    addMarker(LatLng(destinationLatitude,destinationLongitude), "Destination", BitmapDescriptor.defaultMarkerWithHue(90));
    getPolyLine();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Maps PolyLine"),backgroundColor: Colors.green,),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: googlePlex,
        myLocationEnabled: true,
        tiltGesturesEnabled: true,
        compassEnabled: true,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,
        polylines: Set<Polyline>.of(polylines.values),
        markers: Set<Marker>.of(markers.values),
        onMapCreated: (GoogleMapController _controller){
          controller.complete(_controller);
        },
      ),
    );
  }
}
