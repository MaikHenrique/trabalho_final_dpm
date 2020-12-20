import 'dart:async';
import 'dart:collection';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:navigation/second.dart';
import 'package:location/location.dart';

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirdtPageState();
  }
}

class _FirdtPageState extends State<FirstPage> {
  GoogleMapController mapController;
  LatLng _center = LatLng(-26.906378, -49.077445);
  MapType _currentMapType = MapType.normal;
  Set<Circle> circles = null;
  Location location = Location();
  double _latitude = 0;
  double _longitude = 0;

  void setCircle() {
    setState(() {
      circles = Set.from([
        Circle(
          circleId: CircleId('id'),
          center: _center,
          radius: 200,
          strokeWidth: 3,
          strokeColor: Colors.blue,
          fillColor: Colors.blue.withOpacity(0.2),
        )
      ]);
    });
    _center = LatLng(-26.907480, -49.077445);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
            circles: circles,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(children: <Widget>[
                FloatingActionButton(
                  heroTag: 'btnQrCode',
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
                  heroTag: 'btnCirculo',
                  onPressed: setCircle,
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
