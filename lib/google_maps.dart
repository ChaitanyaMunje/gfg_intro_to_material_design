import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intro_to_material_design/direction_repo.dart';

import 'direction_model.dart';

// class GoogleMapsPage extends StatefulWidget {
//   const GoogleMapsPage({Key? key}) : super(key: key);
//
//   @override
//   _GoogleMapsPageState createState() => _GoogleMapsPageState();
// }
//
// class _GoogleMapsPageState extends State<GoogleMapsPage> {
//   Set<Marker> markerList = {};
//
//   static const delhiPos =
//       CameraPosition(target: LatLng(28.6139, 77.2090), zoom: 11.5);
//   late GoogleMapController googleMapController;
//   late Marker originMarker;
//   late Marker destinationMarker;
//
//   @override
//   void dispose() {
//     googleMapController.dispose();
//     super.dispose();
//   }
//
//   // void onMapCreated(GoogleMapController controller) {
//   //   setState(() {
//   //     markerList.add(Marker(
//   //         markerId: MarkerId('id-1'),
//   //         position: LatLng(28.6139, 77.2090),
//   //         infoWindow: InfoWindow(
//   //           title: 'Delhi',
//   //           snippet: 'Capital of India',
//   //         )));
//   //   });
//   // }
//
//   void addMarker(LatLng pos) {
//     if (originMarker == null ||
//         (originMarker != null && destinationMarker != null)) {
//       setState(() {
//         originMarker = Marker(
//             markerId: MarkerId("Origin"),
//             infoWindow: InfoWindow(title: 'Origin'),
//             icon: BitmapDescriptor.defaultMarkerWithHue(
//                 BitmapDescriptor.hueGreen),
//             position: pos);
//       });
//     }else{
//       setState(() {
//         destinationMarker = Marker(
//             markerId: MarkerId("Destination"),
//             infoWindow: InfoWindow(title: 'Destination'),
//             icon: BitmapDescriptor.defaultMarkerWithHue(
//                 BitmapDescriptor.hueRed),
//             position: pos);
//       });
//
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Google Maps")),
//       body: GoogleMap(
//         initialCameraPosition: delhiPos,
//         myLocationButtonEnabled: false,
//         zoomControlsEnabled: false,
//         markers: {
//           if (originMarker != null) originMarker,
//           if (destinationMarker != null) destinationMarker
//         },
//         onLongPress: addMarker,
//         onMapCreated: (controller) => googleMapController = controller,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           googleMapController
//               .animateCamera(CameraUpdate.newCameraPosition(delhiPos));
//         },
//         backgroundColor: Colors.blue,
//         child: Icon(Icons.center_focus_strong),
//       ),
//       //initialCameraPosition: CameraPosition(target: LatLng(28.6139, 77.2090),zoom: 15),),
//     );
//   }
// }
//
// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   static const _initialCameraPosition = CameraPosition(
//     target: LatLng(37.773972, -122.431297),
//     zoom: 11.5,
//   );
//
//   late GoogleMapController _googleMapController;
//   late Marker _origin;
//   late Marker _destination;
//   late Directions _info;
//
//   @override
//   void dispose() {
//     _googleMapController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: false,
//         title: const Text('Google Maps'),
//         actions: [
//           if (_origin != null)
//             TextButton(
//               onPressed: () => _googleMapController.animateCamera(
//                 CameraUpdate.newCameraPosition(
//                   CameraPosition(
//                     target: _origin.position,
//                     zoom: 14.5,
//                     tilt: 50.0,
//                   ),
//                 ),
//               ),
//               style: TextButton.styleFrom(
//                 primary: Colors.green,
//                 textStyle: const TextStyle(fontWeight: FontWeight.w600),
//               ),
//               child: const Text('ORIGIN'),
//             ),
//           if (_destination != null)
//             TextButton(
//               onPressed: () => _googleMapController.animateCamera(
//                 CameraUpdate.newCameraPosition(
//                   CameraPosition(
//                     target: _destination.position,
//                     zoom: 14.5,
//                     tilt: 50.0,
//                   ),
//                 ),
//               ),
//               style: TextButton.styleFrom(
//                 primary: Colors.blue,
//                 textStyle: const TextStyle(fontWeight: FontWeight.w600),
//               ),
//               child: const Text('DEST'),
//             )
//         ],
//       ),
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           GoogleMap(
//             myLocationButtonEnabled: false,
//             zoomControlsEnabled: false,
//             initialCameraPosition: _initialCameraPosition,
//             onMapCreated: (controller) => _googleMapController = controller,
//             markers: {
//               if (_origin != null) _origin,
//               if (_destination != null) _destination
//             },
//             polylines: {
//               if (_info != null)
//                 Polyline(
//                   polylineId: PolylineId('overview_polyline'),
//                   color: Colors.red,
//                   width: 5,
//                   points: _info.polylinePoints
//                       .map((e) => LatLng(e.latitude, e.longitude))
//                       .toList(),
//                 ),
//             },
//             onLongPress: _addMarker,
//           ),
//           if (_info != null)
//             Positioned(
//               top: 20.0,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 6.0,
//                   horizontal: 12.0,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.yellowAccent,
//                   borderRadius: BorderRadius.circular(20.0),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.black26,
//                       offset: Offset(0, 2),
//                       blurRadius: 6.0,
//                     )
//                   ],
//                 ),
//                 child: Text(
//                   '${_info.totalDistance}, ${_info.totalDuration}',
//                   style: const TextStyle(
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Theme.of(context).primaryColor,
//         foregroundColor: Colors.black,
//         onPressed: () => _googleMapController.animateCamera(
//           _info != null
//               ? CameraUpdate.newLatLngBounds(_info.bounds, 100.0)
//               : CameraUpdate.newCameraPosition(_initialCameraPosition),
//         ),
//         child: const Icon(Icons.center_focus_strong),
//       ),
//     );
//   }
//
//   void _addMarker(LatLng pos) async {
//     if (_origin == null || (_origin != null && _destination != null)) {
//       // Origin is not set OR Origin/Destination are both set
//       // Set origin
//       setState(() {
//         _origin = Marker(
//           markerId: MarkerId('origin'),
//           infoWindow: const InfoWindow(title: 'Origin'),
//           icon:
//           BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//           position: pos,
//         );
//         // Reset destination
//         //_destination = null;
//
//         // Reset info
//         //_info = null;
//       });
//     } else {
//       // Origin is already set
//       // Set destination
//       setState(() {
//         _destination = Marker(
//           markerId: MarkerId('destination'),
//           infoWindow: const InfoWindow(title: 'Destination'),
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//           position: pos,
//         );
//       });
//
//       // Get directions
//       final directions = await DirectionsRepository()
//           .getDirections(origin: _origin.position, destination: pos);
//       setState(() => _info = directions!);
//     }
//   }
// }