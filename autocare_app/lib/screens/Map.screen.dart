import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng location1 = LatLng(33.7885435, 35.4843493);
  static const LatLng location2 = LatLng(33.7894872, 35.4892972);
  static const LatLng location3 = LatLng(33.7872303, 35.4866043);

  void getPolyPoints() async {}

  final CameraPosition initialPosition = CameraPosition(
    target: LatLng(33.7868955, 35.4869220),
    zoom: 15,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        markers: {
          Marker(
            markerId: MarkerId("source"),
            position: location1,
          ),
          Marker(
            markerId: MarkerId("destination"),
            position: location2,
          ),
          Marker(
            markerId: MarkerId("destination"),
            position: location3,
          ),
        },
      ),
    );
  }
}
