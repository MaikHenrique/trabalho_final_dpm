import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GooMap extends StatefulWidget {
  final LocationData location;
  GooMap({this.location})

  @override
  _GooMapState createState() => _GooMapState();
}

class _GooMapState extends State<GooMap> {
  //Location
  LocationData _locationData;
  //Maps
  Set<Circle> _circles = HashSet<Circle>();
  //Type Controllers
  bool _isCircle = false;

  @override
  void initState() {
    super.initState();
    _locationData = widget.location;
  }
}
