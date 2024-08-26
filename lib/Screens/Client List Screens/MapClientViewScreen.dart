import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapClientViewScreen extends StatefulWidget {
  const MapClientViewScreen({Key? key}) : super(key: key);

  @override
  _MapClientViewScreenState createState() => _MapClientViewScreenState();
}

class _MapClientViewScreenState extends State<MapClientViewScreen> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Map'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: GoogleMap(
          onMapCreated: (controller) {
            mapController = controller;
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(37.42796133580664, -122.085749655962),
            zoom: 14.4746,
          ),
        ),
      ),
    );
  }
}
