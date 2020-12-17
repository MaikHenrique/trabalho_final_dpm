import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:navigation/second.dart';
import 'package:location/location.dart';

class FirstPage extends StatelessWidget {
  GoogleMapController mapController;
  final LatLng _center = const LatLng(-26.906378, -49.077445);
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onCriaCirculo() {
    //BuildContext
  }

  void _checkLocationPermission() async {
    _serviceEnabled = await location.serviceEnabled();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Localização"),
        backgroundColor: Colors.red[700],
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SecondPage()));
                  },
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.assignment_ind_rounded, size: 36.0),
                ),
                SizedBox(height: 16.0),
                FloatingActionButton(
                  onPressed: _onCriaCirculo,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.add_circle_rounded, size: 36.0),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
